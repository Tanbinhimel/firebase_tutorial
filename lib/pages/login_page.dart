import 'package:firebase_tutorial/pages/register_page.dart';
import 'package:firebase_tutorial/widgets/auth_page_button.dart';
import 'package:firebase_tutorial/widgets/text_input_field.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future _onSignIn() async {
    try {
      showDialog(
          context: context,
          builder: (context) {
            return const Center(child: CircularProgressIndicator());
          });
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: _emailController.text.trim(),
              password: _passwordController.text.trim())
          .then((value) => Navigator.pop(context));
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      _showErrorMessage(e.code);
    }
  }

  _onTapRegisterNow() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const RegisterPage()),
    );
  }

  _showErrorMessage(errorCode) {
    showDialog(
        context: context,
        builder: (context) {
          return Center(
              child: Text(errorCode,
                  style: const TextStyle(
                      color: Colors.red,
                      fontSize: 18,
                      fontWeight: FontWeight.bold)));
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        body: SafeArea(
            child: Center(
                child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: SingleChildScrollView(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                          const Icon(Icons.android, size: 100),
                          Text('Hello Again!',
                              style: GoogleFonts.bebasNeue(fontSize: 52)),
                          const SizedBox(height: 10),
                          const Text('Welcome Back!',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20)),
                          const SizedBox(height: 25),
                          TextInputField(
                              textEditingController: _emailController,
                              hintText: 'Email'),
                          TextInputField(
                              textEditingController: _passwordController,
                              hintText: 'Password',
                              obscureText: true),
                          AuthPageButton(
                              buttonText: 'Sign In',
                              onPressedButton: _onSignIn),
                          const SizedBox(height: 25),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text('New Here? '),
                                GestureDetector(
                                  onTap: _onTapRegisterNow,
                                  child: const Text('Register Now',
                                      style: TextStyle(
                                          color: Colors.blue,
                                          fontWeight: FontWeight.bold)),
                                )
                              ])
                        ]))))));
  }
}
