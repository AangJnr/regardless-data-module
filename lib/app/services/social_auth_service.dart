import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:multiple_result/multiple_result.dart';
import 'package:regardless_data_module/domain/model/new_user.dart';
import '../../app/app.logger.dart';
import '../../domain/model/session_manager.dart';
import '../app.locator.dart';
import '../utils/url.dart';

class SocialAuthService {
  final firebaseAuth = FirebaseAuth.instance;
  final _sessionManager = module<SessionManager>();

  bool isSignInWithEmailLink(String link) {
    return firebaseAuth.isSignInWithEmailLink(link);
  }

  Future<Result<User, Exception>> signInWithGoogle() async {
    // Trigger the authentication flow
    try {
      UserCredential userRequest;

      GoogleAuthProvider googleProvider = GoogleAuthProvider();
      googleProvider.addScope(
        'https://www.googleapis.com/auth/userinfo.profile',
      );
      if (kIsWeb) {
        userRequest = await FirebaseAuth.instance.signInWithPopup(
          googleProvider,
        );
      } else {
        userRequest = await FirebaseAuth.instance.signInWithProvider(
          googleProvider,
        );
      }

      if (userRequest.user != null) {
        final user = userRequest.user;
        if (user != null) {
          // 1. Extract metadata from additionalUserInfo
          final profile = userRequest.additionalUserInfo?.profile;

          if (profile != null) {
            // Google returns flat key-value pairs in the profile map
            final String? email = profile['email'];
            final String? fullName = profile['name'];
            final String? firstName = profile['given_name'];
            final String? lastName = profile['family_name'];
            final String? profilePicture = profile['picture']; // URL string

            _sessionManager.saveNewUserData(
              NewUser(
                email: email ?? '',
                fullName: fullName ?? '$firstName $lastName'.trim(),
                picture: profilePicture ?? '',
              ),
            );
            getLogger("SocialAuthService").i(
              'Google User Details: $firstName $lastName, Email: $email, Photo: $profilePicture',
            );
          }

          return Success(user);
        }
        return Success(userRequest.user!);
      }
      return Error(Exception('Sign in not completed.'));
    } on FirebaseAuthException catch (e) {
      getLogger("SocialAuthService").e(e);
      return Error(Exception(e));
    }
  }

  Future<Result<User, Exception>> signInAnonymously() async {
    // Trigger the authentication flow
    try {
      final userRequest = await FirebaseAuth.instance.signInAnonymously();
      if (userRequest.user != null) {
        return Success(userRequest.user!);
      }
      return Error(Exception('Sign in not completed.'));
    } on FirebaseAuthException catch (e) {
      getLogger("SocialAuthService").e(e);
      return Error(Exception(e));
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
      final appleProvider = AppleAuthProvider()
          .addScope('email')
          .addScope('name');
      UserCredential userRequest;
      if (kIsWeb) {
        userRequest = await FirebaseAuth.instance.signInWithPopup(
          appleProvider,
        );
      } else {
        userRequest = await FirebaseAuth.instance.signInWithProvider(
          appleProvider,
        );
      }

      if (userRequest.user != null) {
        final user = userRequest.user;
        if (user != null) {
          // 1. Extract metadata from additionalUserInfo
          final profile = userRequest.additionalUserInfo?.profile;
          getLogger("SocialAuthService").i('Apple User Details: $profile');
          if (profile != null) {
            // Apple provides nested name objects inside the profile map
            final nameMap = profile['name'] as Map<String, dynamic>?;
            final String? firstName = nameMap?['firstName'];
            final String? lastName = nameMap?['lastName'];
            final String? email = profile['email'];

            final String fullName = '${firstName ?? ''} ${lastName ?? ''}'
                .trim();

            // 2. Proactively update the profile if displayName is empty
            if (user.displayName == null || user.displayName!.isEmpty) {
              if (fullName.isNotEmpty) {
                await user.updateDisplayName(fullName);
                await user.reload(); // Refresh the user cached state
              }
            }

            _sessionManager.saveNewUserData(
              NewUser(
                email: email ?? '',
                fullName: fullName,
                picture: user.photoURL ?? '',
              ),
            );
            getLogger(
              "SocialAuthService",
            ).i('Apple User Details: $fullName, Email: $email');
          }

          return Success(FirebaseAuth.instance.currentUser!);
        }
        return Success(userRequest.user!);
      }
      return Error(Exception('Sign in not completed.'));
    } catch (e) {
      getLogger("SocialAuthService").e(e);
      return Error(Exception(e));
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
            handleCodeInApp: true,
            androidInstallApp: true,
            iOSBundleId: 'com.regardlessmode.app',
            linkDomain: 'login.regardlessmode.com',
            androidPackageName: 'com.regardless.social_app',
          ),
        )
        .catchError(
          (onError) =>
              throw ('We could not generate email link. Kindly try again later or use another sign-in option.\n$onError'),
        );
  }

  Future<User?> verify(String emailLink) async {
    if (firebaseAuth.isSignInWithEmailLink(emailLink)) {
      getLogger("Social Auth Service").e("Is sign in with link");

      try {
        final email = _sessionManager.get('email');
        final userCredential = await FirebaseAuth.instance.signInWithEmailLink(
          email: email,
          emailLink: emailLink,
        );
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
        try {
          final idToken = await user.getIdToken();
          if (idToken != null) {
            getLogger('SocialAuthService').e('idToken updated!');
            _sessionManager.setAccessToken(idToken);
          }
        } catch (e) {
          getLogger('SocialAuthService').e(e);
        }
      }
    });
  }

  Future<void> logout() {
    return firebaseAuth.signOut();
  }
}
