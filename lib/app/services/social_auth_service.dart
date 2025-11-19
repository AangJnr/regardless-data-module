import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:multiple_result/multiple_result.dart';
import '../../app/app.logger.dart';
import '../../domain/model/session_manager.dart';
import '../app.locator.dart';
import '../utils/url.dart';

class SocialAuthService {
  final firebaseAuth = FirebaseAuth.instance;
  final _sessionManager = module<SessionManager>();
  Future<Result<User, Exception>> signInWithGoogle(
      {bool isPlatformWeb = true}) async {
    // Trigger the authentication flow
    try {
      UserCredential userRequest;

      GoogleAuthProvider googleProvider = GoogleAuthProvider();
      googleProvider
          .addScope('https://www.googleapis.com/auth/contacts.readonly');
      // googleProvider.setCustomParameters({'login_hint': 'user@example.com'});
      if (isPlatformWeb) {
        userRequest =
            await FirebaseAuth.instance.signInWithPopup(googleProvider);
      } else {
        userRequest =
            await FirebaseAuth.instance.signInWithProvider(googleProvider);
      }

      if (userRequest.user != null) {
        return Success(userRequest.user!);
      }
      return Error(Exception('Sign in not completed.'));
    } on FirebaseAuthException catch (e) {
      getLogger("SocialAuthService").e(e);
      //return Error(Exception(e));

      rethrow;
    }
  }

  Future<String?> signInWithFacebook() async {
    // Trigger the sign-in flow
    // final LoginResult loginResult = await FacebookAuth.instance.login();

    // // Create a credential from the access token
    // final OAuthCredential facebookAuthCredential =
    //     FacebookAuthProvider.credential(loginResult.accessToken.token);

    // // Once signed in, return the UserCredential
    // return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);

    return null;
  }

  Future<Result<User, Exception>> signInWithApple() async {
    try {
      final appleProvider =
          AppleAuthProvider().addScope('email').addScope('fullName');
      UserCredential userRequest;
      if (kIsWeb) {
        userRequest =
            await FirebaseAuth.instance.signInWithPopup(appleProvider);
      } else {
        userRequest =
            await FirebaseAuth.instance.signInWithProvider(appleProvider);
      }

      if (userRequest.user != null) {
        return Success(userRequest.user!);
      }
      return Error(Exception('Sign in not completed.'));
    } catch (e) {
      getLogger("SocialAuthService").e(e);
      rethrow;
    }
  }

  Future<User?> getCurrentUser() async {
    return firebaseAuth.currentUser;
  }

  Future<String?> getToken() async {
    return await firebaseAuth.currentUser?.getIdToken();
  }

  Future sendEmailLink(String email) async {
    return firebaseAuth
        .sendSignInLinkToEmail(
            email: email,
            actionCodeSettings: ActionCodeSettings(
                url: '${Url.web}/verification',
                // ignore: deprecated_member_use
//dynamicLinkDomain: 'regardlesssocialapp.page.link',
                handleCodeInApp: true,
                androidInstallApp: true,
                androidPackageName: 'com.regardless.social_app'))
        .catchError((onError) =>
            throw ('We could not generate email link. Kindly try again later or use another sign-in option.\n$onError'))
        .then((value) {});
  }

  Future<User?> verify(String emailLink) async {
    if (firebaseAuth.isSignInWithEmailLink(emailLink)) {
      getLogger("Social Auth Service").e("Is sign in with link");

      try {
        final email = _sessionManager.get('email');
        final userCredential = await FirebaseAuth.instance
            .signInWithEmailLink(email: email, emailLink: emailLink);
        return userCredential.user;
      } catch (error) {
        getLogger("Social Auth Service").e(error);
        return null;
      }
    }
    getLogger("Social Auth Service").e("Is not a sign in with link");
    return null;
  }

  void signOut() {
    firebaseAuth.signOut();
  }

  void listenToAuthTokenChanges() async {
    firebaseAuth.idTokenChanges().listen((user) async {
      if (user != null) {
        try{
        final idToken = await user.getIdToken();
        if (idToken != null) {
          getLogger('SocialAuthService').e('idToken updated!');
          _sessionManager.setAccessToken(idToken);
        }
        }catch(e){
          getLogger('SocialAuthService').e(e);
        }
      }
    });
  }

  Future<void> logout() {
    return firebaseAuth.signOut();
  }
}
