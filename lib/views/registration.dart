import 'package:flutter/material.dart';
import 'package:flutter_application_1/configs/colors.dart';
import 'package:get/get.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Account'),
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/logo.png', height: 150, width: 300),
                ],
              ),

              SizedBox(height: 20),

              Row(
                children: [
                  Text('Full Name', style: TextStyle(color: Colors.deepOrange)),
                ],
              ),

              TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                ),
              ),

              SizedBox(height: 20),

              Row(
                children: [
                  Text('Email', style: TextStyle(color: Colors.deepOrange)),
                ],
              ),

              TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(),
                ),
              ),

              SizedBox(height: 20),

              Row(
                children: [
                  Text('Password', style: TextStyle(color: Colors.deepOrange)),
                ],
              ),

              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  border: OutlineInputBorder(),
                ),
              ),

              SizedBox(height: 20),

              Row(
                children: [
                  Text(
                    'Confirm Password',
                    style: TextStyle(color: Colors.deepOrange),
                  ),
                ],
              ),

              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock_outline),
                  border: OutlineInputBorder(),
                ),
              ),

              SizedBox(height: 20),

              MaterialButton(
                onPressed: () {
                  // Later: create account with backend, then send user to Login
                  Get.offNamed('/');
                },
                color: primaryColor,
                minWidth: 200,
                child: Text('Register', style: TextStyle(color: Colors.white)),
              ),

              SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Already have an account? '),
                  GestureDetector(
                    child: Text(
                      'Login',
                      style: TextStyle(
                        color: secondaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onTap: () {
                      Get.offNamed('/');
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
