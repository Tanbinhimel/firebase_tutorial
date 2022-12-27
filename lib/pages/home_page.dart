import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Future _onPressedSignOut() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: FutureBuilder(builder: (context, snapshot) {
      final currentUser = FirebaseAuth.instance.currentUser?.email;
      return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(currentUser.toString()),
            ElevatedButton(
                onPressed: _onPressedSignOut, child: const Text('Sign Out'))
          ]);
    })));
  }
}
