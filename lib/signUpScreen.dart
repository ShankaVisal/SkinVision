import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:untitled5/controllers/auth.dart';

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
  String? errorMessage = '';

  Future createUserWithEmailAndPassword(BuildContext context) async {
    try {
      await Auth().createUserWithEmailAndPassword(
          email: _useremailController.text,
          password: _passwordController.text,);

      // Get the currently signed-in user
      User? user = FirebaseAuth.instance.currentUser;

      // Update the user's display name
      await user?.updateDisplayName(_usernameController.text);

      //email verification
      //await user?.sendEmailVerification();

      // ignore: use_build_context_synchronously
      /*Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const HomePage()));*/
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: height * 0.15),
                child: Image(
                  image: const AssetImage('assets/loginLogo.png'),
                  width: width * 0.7,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: height * 0.1),
                child: const Text(
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
              const SizedBox(height: 10,),
              if (errorMessage != null)
                Text(
                  errorMessage!,
                  style: const TextStyle(
                    color: Colors.red,
                  ),
                ),
              const SizedBox(height: 25),
              OrangeButton(onPressed: (){
                createUserWithEmailAndPassword(context);
              }, buttonText: 'SignUp'),
              const SizedBox(height: 25),
              const signInmethods()
            ],
          ),
        ),
      ),
    );
  }
}
