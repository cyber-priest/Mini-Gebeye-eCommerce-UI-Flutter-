import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mini_gebeya/main.dart';

class SignUpScreen extends StatefulWidget {
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();

  String? errorPassword;
  String? errorEmail;
  bool onProgress = false;

  bool isValidEmail(String email) {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  }

  bool isValidPhoneNumber(String phone) {
    // Simple validation for demonstration purposes
    return RegExp(r'^\+?[\d\s]{10,}$').hasMatch(phone);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.green.shade300),
      ),
      backgroundColor: Colors.white,
      body: Stack(children: [
        ListView(
          children: [
            SizedBox(height: 30),
            CircleAvatar(
                backgroundColor: Colors.green.shade300,
                radius: 60,
                child: Icon(
                  Icons.shopping_cart,
                  size: 50,
                  color: Colors.white,
                )),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Welcome, ",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Create your account",
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 14,
                ),
              ),
            ),
            SizedBox(height: 20),
            buildTextField(
              controller: fullNameController,
              labelText: "Full Name",
              prefixIcon: Icons.person,
            ),
            buildTextField(
              controller: emailController,
              labelText: "Email",
              prefixIcon: Icons.email,
              keyboardType: TextInputType.emailAddress,
              onChanged: (email) {
                setState(() {
                  errorEmail = isValidEmail(email)
                      ? null
                      : "Invalid email address. Please try again.";
                });
              },
              errorText: errorEmail,
            ),
            buildTextField(
              controller: passwordController,
              labelText: "Password",
              prefixIcon: Icons.lock,
              obscureText: true,
              onChanged: (password) {
                setState(() {
                  errorPassword = password.length >= 6
                      ? null
                      : "Password must be at least 6 characters.";
                });
              },
              errorText: errorPassword,
            ),
            buildTextField(
              controller: phoneNumberController,
              labelText: "Phone Number",
              prefixIcon: Icons.phone,
              keyboardType: TextInputType.phone,
            ),
            buildTextField(
              controller: addressController,
              labelText: "Address",
              prefixIcon: Icons.home,
              maxLines: 2,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: SizedBox(
                width: double.infinity,
                child: InkWell(
                  onTap: () async {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => HomePage()));
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.green.shade300,
                    ),
                    child: Text(
                      "Sign Up",
                      style: TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ]),
    );
  }

  Widget buildTextField({
    required TextEditingController controller,
    required String labelText,
    required IconData prefixIcon,
    bool obscureText = false,
    TextInputType keyboardType = TextInputType.text,
    Function(String)? onChanged,
    int maxLines = 1,
    String? errorText,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        keyboardType: keyboardType,
        onChanged: onChanged,
        maxLines: maxLines,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: labelText,
          labelStyle: TextStyle(fontSize: 12),
          prefixIcon: Icon(prefixIcon),
          errorText: errorText,
        ),
      ),
    );
  }
}
