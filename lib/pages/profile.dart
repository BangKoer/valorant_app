import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:valorant_app/shared/color.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  late User? _user;
  String name = "";
  String email = "";
  String main = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _user = _auth.currentUser;
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    if (_user != null) {
      try {
        DocumentSnapshot userSnapshot =
            await _firestore.collection("users").doc(_user!.uid).get();
        if (userSnapshot.exists) {
          setState(() {
            name = userSnapshot.get("name") ?? "";
            email = userSnapshot.get("email") ?? "";
            main = userSnapshot.get("main") ?? "";
          });
        }
      } catch (e) {
        print(e.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      child: Center(
        child: Column(
          children: [
            CircleAvatar(
              backgroundColor: SecondColor,
              // backgroundImage: AssetImage("assets/logo.png"),
              radius: 100,
              child: Image.asset(
                "assets/logo.png",
                scale: 3,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ProfileTile(ikon: Icons.person, title: "Name", isi: name),
            ProfileTile(ikon: Icons.email, title: "Email", isi: email),
            ProfileTile(ikon: Icons.support_agent, title: "Main", isi: main),
          ],
        ),
      ),
    );
  }
}

class ProfileTile extends StatelessWidget {
  final IconData ikon;
  final String title;
  final String isi;
  const ProfileTile({
    super.key,
    required this.ikon,
    required this.title,
    required this.isi,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30.0),
      child: Container(
        width: 300,
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 9),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(9),
            border: Border.all(
              color: Maincolor,
            )),
        child: Row(
          children: [
            Icon(
              ikon,
              color: Colors.white,
              size: 40,
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                Text(
                  isi,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
