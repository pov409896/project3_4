import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project3_5/util/app_text.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final User? user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: false, title: Text("Profile")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: CircleAvatar(
              radius: 80,
              backgroundImage: (user?.photoURL?.isNotEmpty ?? false)
                  ? NetworkImage(user!.photoURL!)
                  : NetworkImage(
                      "https://i.pinimg.com/736x/32/9b/54/329b54d07444f009b0634f438db9a449.jpg",
                    ),
              child: Text(
                (user?.email?.isNotEmpty ?? false) ? user!.email! : "No email",
              ),
            ),
          ),
        ],
      ),
    );
  }
}
