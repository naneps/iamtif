import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:iamtif/app/common/logger.dart';
import 'package:iamtif/app/models/user_model.dart';
import 'package:iamtif/app/routes/app_pages.dart';

class FirebaseAuthService extends GetxService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final CollectionReference usersRef =
      FirebaseFirestore.instance.collection('users');

  @override
  void onInit() {
    super.onInit();
    _auth.authStateChanges().listen((User? user) {
      if (user == null) {
        Get.offAllNamed(Routes.AUTH);
        Logger.info('User is currently signed out!');
      } else {
        Get.offAllNamed(Routes.CORE);
        Logger.info('User is signed in!');
      }
    });
  }

  Future<void> signUpWithEmailAndPassword(
    UserModel userModel, {
    required Function(bool) onLoading,
    required Function(User) onSuccess,
    required Function(String) onError,
  }) async {
    try {
      onLoading(true);
      await _auth
          .createUserWithEmailAndPassword(
        email: userModel.email!,
        password: userModel.password!,
      )
          .then((res) async {
        if (res.user != null) {
          await res.user!.sendEmailVerification();
          await res.user!.updateDisplayName(userModel.name);
          onSuccess(res.user!);
        }
        usersRef.doc(res.user!.uid).update({
          "name": userModel.name,
        });
      });
    } catch (e) {
      handleAuthError(e, onLoading, onError);
      rethrow;
    }
  }

  Future<void> signInWithEmailAndPassword({
    required UserModel userModel,
    required Function(bool) onLoading,
    required Function(User) onSuccess,
    required Function(String) onError,
  }) async {
    try {
      onLoading(true);

      UserCredential result = await _auth.signInWithEmailAndPassword(
        email: userModel.email!,
        password: userModel.password!,
      );

      onLoading(false);
      onSuccess(result.user!);
    } catch (e) {
      handleAuthError(e, onLoading, onError);
      rethrow;
    }
  }

  Future<void> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      await _auth.signInWithCredential(credential);
    } catch (e) {
      handleAuthError(e, null, null);
      rethrow;
    }
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();
      await googleSignIn.signOut();
    } catch (e) {
      handleAuthError(e, null, null);
      rethrow;
    }
  }

  void handleAuthError(
    dynamic error,
    Function(bool)? onLoading,
    Function(String)? onError,
  ) {
    print("=======================================");
    if (error is FirebaseAuthException) {
      String errorCode = error.code;
      String errorMessage = error.message ?? "An error occurred";
      onLoading?.call(false);
      onError?.call(errorMessage);
      Logger.error("FirebaseAuth error: $errorMessage");
      FirebaseCrashlytics.instance.recordError(error, StackTrace.current);
    } else {
      // Handle other non-Firebase Authentication exceptions
      onLoading?.call(false);
      onError?.call(error.toString());
    }
    throw error;
  }

  void handleFirestoreError(dynamic error) {
    print("Firestore error: $error");
  }
}
