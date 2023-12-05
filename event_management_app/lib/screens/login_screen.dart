import 'package:event_management_app/widgets/custom_input_form.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text("Login"),
          SizedBox(
            height: 20,
          ),
          CustomInputForm(
              icon: Icons.email, label: "Email", hint: "Enter Your Email")
        ],
      ),
    );
  }
}
