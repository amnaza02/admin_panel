import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AdminSignIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background Image
          Image.asset(
            "images/1.jpg", 
            fit: BoxFit.cover,
          ),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 40.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
               
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Welcome!",
                      style: GoogleFonts.poppins(
                        fontSize: 70, 
                        fontWeight: FontWeight.bold,
                        color: Colors.black, 
                      ),
                    ),
                    SizedBox(height: 20),
                    SizedBox(
                      width: 400, 
                      child: Text(
                        "We’re glad to have you back!  You can now manage the system and stay updated with the latest changes easily.",
                        style: GoogleFonts.poppins(
                          fontSize: 20, 
                          color: Colors.black, 
                        ),
                      ),
                    ),
                  ],
                ),

                Container(
                  width: 450, 
                  padding: EdgeInsets.all(32.0), 
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.6), 
                    borderRadius: BorderRadius.circular(16), 
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Sign In",
                        style: GoogleFonts.poppins(
                          fontSize: 28, 
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 24),
                      TextField(
                        style: TextStyle(color: Colors.black), 
                        decoration: InputDecoration(
                          labelText: "Email",
                          labelStyle: TextStyle(color: Colors.black87), 
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 16),
                      TextField(
                        obscureText: true,
                        style: TextStyle(color: Colors.black), 
                        decoration: InputDecoration(
                          labelText: "Password",
                          labelStyle: TextStyle(color: Colors.black87), 
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 24),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            // Sign in logic
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 163, 119, 178),
                            padding: EdgeInsets.symmetric(vertical: 14), 
                          ),
                          child: Text(
                            "Sign In",
                            style: GoogleFonts.poppins(fontSize: 20, color: Colors.black),
                          ),
                        ),
                      ),
                      SizedBox(height: 30), 
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}