import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  // Sign in with Google
  Future<User?> signInWithGoogle() async {
    try {
      print("Starting Google Sign-In process...");
      
      // Trigger the Google Sign-In process
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        print("User canceled Google Sign-In.");
        return null; // User canceled the sign-in process
      }

      print("Google Sign-In successful. Fetching authentication tokens...");
      
      // Obtain the authentication details from Google
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      if (googleAuth.accessToken == null || googleAuth.idToken == null) {
        print("Missing Google authentication tokens.");
        return null;
      }

      // Create a new credential
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      print("Signing into Firebase...");
      
      // Sign in to Firebase with the Google credential
      final UserCredential userCredential = await _firebaseAuth.signInWithCredential(credential);

      print("Firebase Sign-In successful. User: ${userCredential.user?.email}");
      
      // Return the Firebase User
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      print("FirebaseAuthException: ${e.message}");
      return null;
    } catch (e) {
      print("Google Sign-In Error: $e");
      return null;
    }
  }

  // Sign out of Google and Firebase
  Future<void> signOut() async {
    await _googleSignIn.signOut();
    await _firebaseAuth.signOut();
    print("User signed out.");
  }

  // Check if the user is already signed in
  Future<User?> getCurrentUser() async {
    return _firebaseAuth.currentUser;
  }
}
