import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:iamtif/app/models/user_model.dart';

class FirebaseAuthService extends GetxService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final CollectionReference usersRef =
      FirebaseFirestore.instance.collection('users');

  Rx<User?> user = Rx<User?>(null);

  @override
  void onInit() {
    super.onInit();
    _auth.authStateChanges().listen((User? newUser) {
      user(newUser);
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

      final UserCredential result = await _auth.signInWithEmailAndPassword(
        email: userModel.email!,
        password: userModel.password!,
      );

      await result.user!.updateDisplayName(userModel.name);
      await createUserToFirestore();

      onLoading(false);
      onSuccess(result.user!);
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
      await createUserToFirestore();
    } catch (e) {
      handleAuthError(e);
      rethrow;
    }
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();
      await googleSignIn.signOut();
    } catch (e) {
      handleAuthError(e);
      rethrow;
    }
  }

  Future<void> createUserToFirestore() async {
    try {
      final User? currentUser = _auth.currentUser;
      if (currentUser != null) {
        await usersRef.doc(currentUser.uid).set({
          "name": currentUser.displayName,
          "email": currentUser.email,
          "photoUrl": currentUser.photoURL,
          "uid": currentUser.uid,
          "createdAt": FieldValue.serverTimestamp(),
        });
      }
    } catch (e) {
      handleFirestoreError(e);
      rethrow;
    }
  }

  void handleAuthError(dynamic error,
      [Function(bool)? onLoading, Function(String)? onError]) {
    onLoading?.call(false);
    onError?.call(error.toString());
    print("Authentication error: $error");
  }

  void handleFirestoreError(dynamic error) {
    print("Firestore error: $error");
  }
}
