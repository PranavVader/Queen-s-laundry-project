import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color(0xFFD9D9D9),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Top Section with Logo and Title
          Padding(
            padding: EdgeInsets.only(top: screenHeight * 0.1),
            child: Column(
              children: [
                Image.asset(
                  'lib/assets/logo1.png', // Replace with your asset path
                  height: screenHeight * 0.5,
                  width: screenHeight * 1.0,
                  fit: BoxFit.contain,
                ),
                SizedBox(height: screenHeight * 0.02),
                Text(
                  "Queen's Hi-Tech Laundry",
                  style: TextStyle(
                    fontSize: screenWidth * 0.06,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue[800],
                  ),
                ),
              ],
            ),
          ),

          // Bottom Section with Login Button
          Padding(
            padding: EdgeInsets.all(screenWidth * 0.04),
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: EdgeInsets.all(screenWidth * 0.04),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "LOGIN",
                      style:
                      TextStyle(fontSize: screenWidth * 0.05, fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    ElevatedButton.icon(
                      onPressed: () {
                        // Navigate to Dashboard Screen
                        Navigator.pushReplacementNamed(context, '/dashboard');
                      },
                      icon: ClipOval(
                        child: Image.asset(
                          'lib/assets/google-logo.jpg', // Google logo asset path
                          height: screenWidth * 0.08,
                          width: screenWidth * 0.08,
                          fit: BoxFit.cover,
                        ),
                      ),
                      label: Text("Login with Google"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                        minimumSize:
                        Size(double.infinity, screenHeight * 0.06), // Full-width button with dynamic height
                        shape:
                        RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
