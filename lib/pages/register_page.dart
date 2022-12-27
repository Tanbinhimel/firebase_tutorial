import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_tutorial/pages/home_page.dart';
import 'package:firebase_tutorial/widgets/auth_page_button.dart';
import 'package:firebase_tutorial/widgets/text_input_field.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  Future _onRegister() async {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();
    final confirmPassword = _confirmPasswordController.text.trim();
    if (password == confirmPassword) {
      try {
        await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password)
            .then((value) => Navigator.push(context,
                MaterialPageRoute(builder: (context) => const HomePage())));
      } on FirebaseAuthException catch (e) {
        // firebase error
      }
    } else {
      // password mismatched
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        body: SafeArea(
            child: Center(
                child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(Icons.lock, size: 100),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Register Here',
                                style: GoogleFonts.bebasNeue(fontSize: 52)),
                          ),
                          TextInputField(
                              textEditingController: _emailController,
                              hintText: 'Email'),
                          TextInputField(
                              textEditingController: _passwordController,
                              hintText: 'Password',
                              obscureText: true),
                          TextInputField(
                              textEditingController: _confirmPasswordController,
                              hintText: 'Confirm Password',
                              obscureText: true),
                          AuthPageButton(
                              buttonText: 'Register',
                              onPressedButton: _onRegister)
                        ])))));
  }
}
