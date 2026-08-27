import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class StudentScreen extends StatefulWidget {
  const StudentScreen({super.key});

  @override
  State<StudentScreen> createState() => _StudentScreenState();
}

class _StudentScreenState extends State<StudentScreen> {
  final name = TextEditingController();
  final gender = TextEditingController();
  final address = TextEditingController();
  final image = TextEditingController();
  void adddata() async {
    try {
      if (name.text.isEmpty ||
          gender.text.isEmpty ||
          address.text.isEmpty ||
          image.text.isEmpty) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("All Field Requere")));
        return;
      }
      await FirebaseFirestore.instance.collection('student').add({
        'name': name.text,
        'gender': gender.text,
        'address': address.text,
        'image': image.text,
      });
      name.clear();
      gender.clear();
      address.clear();
      image.clear();
      Navigator.pop(context);
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Add Student Success")));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("$e")));
      log(e.toString());
    }
  }

  void deleteData(String id) async {
    await FirebaseFirestore.instance.collection('student').doc(id).delete();
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text("Delete Student Success")));
  }

  void updateData(String id) async {
    await FirebaseFirestore.instance.collection('student').doc(id).update({
      'name': name.text,
      'gender': gender.text,
      'address': address.text,
      'image': image.text,
    });
    name.clear();
    gender.clear();
    address.clear();
    image.clear();
    Navigator.pop(context);
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text("Update Student Success")));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Student Screen")),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('student').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          }
          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              final stu = snapshot.data!.docs[index];
              return Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadiusGeometry.circular(10),
                        child: Image.network(
                          height: 80,
                          width: 100,
                          fit: BoxFit.cover,
                          stu['image'],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(stu['name'], style: TextStyle(fontSize: 22)),
                            Text(stu['gender'], style: TextStyle(fontSize: 22)),
                            Row(
                              children: [
                                Text(
                                  stu['address'],
                                  style: TextStyle(fontSize: 22),
                                ),
                                SizedBox(width: 70),
                                GestureDetector(
                                  onTap: () {
                                    name.text = stu['name'];
                                    gender.text = stu['gender'];
                                    address.text = stu['address'];
                                    image.text = stu['image'];
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          title: Text("Update Student"),
                                          content: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              TextField(
                                                controller: name,
                                                decoration: InputDecoration(
                                                  hintText: "stu_name",
                                                ),
                                              ),
                                              TextField(
                                                controller: gender,
                                                decoration: InputDecoration(
                                                  hintText: "stu_gender",
                                                ),
                                              ),
                                              TextField(
                                                controller: address,
                                                decoration: InputDecoration(
                                                  hintText: "stu_address",
                                                ),
                                              ),
                                              TextField(
                                                controller: image,
                                                decoration: InputDecoration(
                                                  hintText: "stu_image",
                                                ),
                                              ),
                                            ],
                                          ),
                                          actions: [
                                            ElevatedButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: Text("Cancel"),
                                            ),
                                            ElevatedButton(
                                              onPressed: () {
                                                updateData(stu.id);
                                              },
                                              child: Text(
                                                "Update",
                                                style: TextStyle(
                                                  color: Colors.blue,
                                                ),
                                              ),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                  child: Icon(Icons.edit, color: Colors.green),
                                ),
                                SizedBox(width: 5),
                                GestureDetector(
                                  onTap: () {
                                    deleteData(stu.id);
                                  },
                                  child: Icon(Icons.delete, color: Colors.red),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: Container(
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.blue,
        ),
        child: IconButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text("Add Student"),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextField(
                        controller: name,
                        decoration: InputDecoration(hintText: "stu_name"),
                      ),
                      TextField(
                        controller: gender,
                        decoration: InputDecoration(hintText: "stu_gender"),
                      ),
                      TextField(
                        controller: address,
                        decoration: InputDecoration(hintText: "stu_address"),
                      ),
                      TextField(
                        controller: image,
                        decoration: InputDecoration(hintText: "stu_image"),
                      ),
                    ],
                  ),
                  actions: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("Cancel"),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        adddata();
                      },
                      child: Text("Add", style: TextStyle(color: Colors.blue)),
                    ),
                  ],
                );
              },
            );
          },
          icon: Icon(Icons.add, color: Colors.white),
        ),
      ),
    );
  }
}
