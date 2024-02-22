import 'package:flutter/material.dart';
import 'package:notes_application/screens/home.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      minimum: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Center(
            child: Column(
              children: [
                Text(
                  'Welcome',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  'Login to continue',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
              padding: const EdgeInsetsDirectional.only(start: 5, bottom: 10),
              child: const Text(
                'Username',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              )),
          TextField(
            controller: usernameController,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade300),
              ),
              hintText: 'write your username',
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: Colors.lightBlueAccent,
                ),
              ),
              fillColor: Colors.grey,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
              padding: const EdgeInsetsDirectional.only(start: 5, bottom: 10),
              child: const Text(
                'Password',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              )),
          TextFormField(
            obscureText: true,
            controller: passwordController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade300),
              ),
              hintText: 'write your password',
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: Colors.lightBlueAccent,
                ),
              ),
              fillColor: Colors.grey,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              backgroundColor: Colors.lightBlueAccent,
              minimumSize: const Size(double.infinity, 60),
            ),
            onPressed: () {
              // Validate returns true if the form is valid, or false otherwise.
              if (usernameController.text.isNotEmpty &&
                  passwordController.text.isNotEmpty) {
                Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(),));
              }
            },
            child: const Text('Login', style: TextStyle(color: Colors.white),),
          ),
        ],
      ),
    ));
  }
}
