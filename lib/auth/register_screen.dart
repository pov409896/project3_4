import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:project3_5/auth/login_screen.dart';
import 'package:project3_5/auth/register_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final email = TextEditingController();
  final pass = TextEditingController();
  bool isLoading = false;
  void register() async {
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
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email.text,
        password: pass.text,
      );
      Get.snackbar(
        "Message",
        "Please Input Email Password",
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
      Get.to(LoginScreen());
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
              decoration: InputDecoration(hintText: "email"),
            ),
            SizedBox(height: 30),
            TextField(
              controller: pass,
              decoration: InputDecoration(hintText: "Password"),
            ),
            SizedBox(height: 50),
            TextButton(
              onPressed: () {
                register();
              },
              child: isLoading
                  ? Center(child: CircularProgressIndicator())
                  : Text("Register", style: TextStyle(fontSize: 22)),
            ),
            TextButton(
              onPressed: () {
                Get.to(LoginScreen());
              },
              child: Text("sign In", style: TextStyle(fontSize: 16)),
            ),
          ],
        ),
      ),
    );
  }
}
