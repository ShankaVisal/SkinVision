import 'package:flutter/material.dart';

import 'loginScreen.dart';

class signupScreen extends StatefulWidget {
  const signupScreen({super.key});

  @override
  State<signupScreen> createState() => _signupScreenState();
}

class _signupScreenState extends State<signupScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _useremailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmpasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: height * 0.15),
              child: Image(
                image: AssetImage('assets/loginLogo.png'),
                width: width * 0.7,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: height * 0.1),
              child: Text(
                "Welcome",
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
            ),
            userInputs(controller: _usernameController, labelText: 'User name'),
            userInputs(controller: _useremailController, labelText: 'Email'),
            userInputs(controller: _passwordController, labelText: 'Password'),
            userInputs(controller: _confirmpasswordController, labelText: 'Confirm password'),
            SizedBox(height: 25),
            OrangeButton(onPressed: (){}, buttonText: 'SignUp'),
            SizedBox(height: 25),
            signInmethods()
          ],
        ),
      ),
    );
  }
}
