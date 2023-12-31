import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:valorant_app/pages/login.dart';
import 'package:valorant_app/services/firebase_authController.dart';
import 'package:valorant_app/shared/color.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _isPasswordVisible = false;
  final _emailTextfieldcontroller = TextEditingController();
  final _passwordTextfieldcontroller = TextEditingController();
  final _nameTextfieldcontroller = TextEditingController();
  final _agentTextfieldcontroller = TextEditingController();
  final CollectionReference _users =
      FirebaseFirestore.instance.collection('users');
  final FirebaseAuthController _auth = FirebaseAuthController();

  @override
  void dispose() {
    // TODO: implement dispose
    _emailTextfieldcontroller.dispose();
    _passwordTextfieldcontroller.dispose();
    _nameTextfieldcontroller.dispose();
    _agentTextfieldcontroller.dispose();
    super.dispose();
  }

  void signUp() async {
    String email = _emailTextfieldcontroller.text;
    String password = _passwordTextfieldcontroller.text;
    String name = _nameTextfieldcontroller.text;
    String agent = _agentTextfieldcontroller.text;
    User? user = await _auth.registerwithEmailandPassword(email, password);
    await _users.doc(user!.uid).set({
      'name': name,
      'email': email,
      'main': agent,
    });
    if (user != null) {
      print("Register Success");
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Register Success!"),
        backgroundColor: Colors.green,
      ));
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => const LoginPage(),
        ),
        (route) => false,
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Error Register! Try again"),
        backgroundColor: Colors.red,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      resizeToAvoidBottomInset: false, // hindari resize saat keyboard muncul
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              Image.asset(
                "assets/logo.png",
                height: 100,
              ),
              const SizedBox(height: 20),
              const Text(
                "Register",
                style: TextStyle(
                  fontFamily: "Valorant",
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                  letterSpacing: 1.5,
                ),
              ),
              const SizedBox(height: 40),
              buildInputField(
                  'Enter your Name', Icons.person, _nameTextfieldcontroller),
              const SizedBox(height: 15),
              buildInputField('Enter your Main Character', Icons.support_agent,
                  _agentTextfieldcontroller),
              const SizedBox(height: 15),
              buildInputField(
                  'Enter your email', Icons.email, _emailTextfieldcontroller),
              const SizedBox(height: 15),
              buildPasswordInputField(
                'Enter your password',
                Icons.lock_person,
              ),
              const SizedBox(height: 30),
              buildRegisterButton(),
              const SizedBox(height: 20),
              buildRegisterLink(),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildInputField(
      String hintText, IconData icon, TextEditingController controller) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF7F8F9),
        border: Border.all(
          color: const Color(0xFFE8ECF4),
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: TextFormField(
          controller: controller,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hintText,
            hintStyle: const TextStyle(
              color: Color(0xFF8391A1),
            ),
            prefixIcon: Icon(
              icon,
              color: const Color(0xFF8391A1),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildPasswordInputField(String hintText, IconData icon) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF7F8F9),
        border: Border.all(
          color: const Color(0xFFE8ECF4),
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: TextFormField(
          controller: _passwordTextfieldcontroller,
          obscureText: !_isPasswordVisible,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hintText,
            hintStyle: const TextStyle(
              color: Color(0xFF8391A1),
            ),
            prefixIcon: Icon(
              icon,
              color: const Color(0xFF8391A1),
            ),
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  _isPasswordVisible = !_isPasswordVisible;
                });
              },
              child: Icon(
                _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                color: const Color(0xFF8391A1),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildRegisterLink() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Have an account? ",
          style: TextStyle(
            color: Color.fromARGB(255, 249, 249, 249),
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => const LoginPage(),
              ),
              (route) => false,
            );
          },
          child: Text(
            "Login",
            style: TextStyle(
              color: Maincolor,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    );
  }

  Widget buildRegisterButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 5,
      ),
      child: Row(
        children: [
          Expanded(
            child: MaterialButton(
              color: Maincolor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              onPressed: () => signUp(),
              child: const Padding(
                padding: EdgeInsets.all(15.0),
                child: Text(
                  "Register",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
