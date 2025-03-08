import 'package:absention/screens/page/qr.dart';
import 'package:absention/screens/widgets/alert/show_message_failed.dart';
import 'package:absention/screens/widgets/alert/show_message_success.dart';
import 'package:absention/screens/widgets/loading/loading_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isPasswordVisible = false;

  Future<void> _loginUser() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const LoadingScreen();
      },
    );
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      Navigator.of(context).pop();
      showSuccessMessage(context, "Login Success");
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const QRPage())
      );
    } catch (e) {
      Navigator.of(context).pop();
      showFailedMessage(context, "Login Failed ${e.toString()}");
    }
  }

  Future<void> _handleGoogleSignIn() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      if(googleUser == null) {
        return;
      }

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const QRPage())
      );
    } catch (e) {
      showFailedMessage(context, "Google login failed ${e.toString()}");
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}