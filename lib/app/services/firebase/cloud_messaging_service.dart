import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:iamtif/app/common/logger.dart';

class CloudMessagingService extends GetxService {
  final _firebaseMessaging = FirebaseMessaging.instance;

  @override
  void onInit() {
    super.onInit();
    _configureMessaging();
  }

  Future<void> _configureMessaging() async {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      Logger.info("Received message: ${message.notification?.title}");
      // Tambahkan penanganan pesan masuk sesuai kebutuhan aplikasi Anda.
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      Logger.info("App opened by notification: ${message.notification?.title}");
      // Tambahkan penanganan tindakan sesuai kebutuhan aplikasi Anda.
    });

    FirebaseMessaging.onBackgroundMessage(_handleBackgroundMessage);

    await _firebaseMessaging.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
  }

  Future<void> _handleBackgroundMessage(RemoteMessage message) async {
    Logger.info("Handling background message: ${message.notification?.title}");
    // Tambahkan penanganan pesan latar belakang sesuai kebutuhan aplikasi Anda.
  }

  Future<String?> getToken() async {
    try {
      String? token = await _firebaseMessaging.getToken();
      Logger.info("Token: $token");
      return token;
    } catch (e) {
      Logger.error("Error getting token: $e");
      return null;
    }
  }

  Future<void> requestPermission() async {
    try {
      NotificationSettings settings =
          await _firebaseMessaging.requestPermission(
        alert: true,
        announcement: false,
        badge: true,
        carPlay: false,
        criticalAlert: false,
        provisional: false,
        sound: true,
      );
      Logger.info("User granted permission: ${settings.authorizationStatus}");
    } catch (e) {
      Logger.error("Error requesting permission: $e");
      // report crashLitics
    }
  }
}
