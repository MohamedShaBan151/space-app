import 'package:flutter/material.dart';
import 'package:space/core/confg/routes.dart';

import 'package:space/core/constants/app_text_style.dart';
import 'package:space/core/constants/button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "assets/images/login.png",
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Expanded(
                
                  child: Center(
                    child: Row(mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            "Explore \nthe \nuniverse",
                            style: AppTextStyle.boldtext,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                MyButton(Title: "Login", icon: Icons.arrow_forward, onPressed: () {
                  Navigator.pushReplacementNamed(context, Routes.home);  
                },),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
