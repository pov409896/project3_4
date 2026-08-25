import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:project3_5/auth/register_screen.dart';
import 'package:project3_5/main_home_page.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final email = TextEditingController();
  final pass = TextEditingController();
  bool isLoading = false;
  void login() async {
    try {
      if (email.text.isEmpty || pass.text.isEmpty) {
        Get.snackbar(
          "Message",
          "Please Input Email Password",
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
        return;
      }
      setState(() {
        isLoading = true;
      });
      await Future.delayed(Duration(seconds: 2));
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email.text,
        password: pass.text,
      );
      Get.snackbar(
        "Message",
        "Login Success",
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
      Get.to(MainHomePage());
      email.clear();
      pass.clear();
    } catch (e) {
      if (email.text.isEmpty || pass.text.isEmpty) {
        Get.snackbar(
          "Message",
          "Please Input Email Password",
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
        return;
      }
    } finally {
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: false),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: email,
              decoration: InputDecoration(hintText: "Username"),
            ),
            SizedBox(height: 30),
            TextField(
              controller: pass,
              decoration: InputDecoration(hintText: "Password"),
            ),
            SizedBox(height: 50),
            TextButton(
              onPressed: () {
                login();
              },
              child: isLoading
                  ? Center(child: CircularProgressIndicator())
                  : Text("Login", style: TextStyle(fontSize: 22)),
            ),
            TextButton(
              onPressed: () {
                Get.to(RegisterScreen());
              },
              child: Text("register", style: TextStyle(fontSize: 16)),
            ),
          ],
        ),
      ),
    );
  }
}
