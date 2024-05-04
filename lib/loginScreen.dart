import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:untitled5/signUpScreen.dart';

class loginScreen extends StatefulWidget {
  const loginScreen({super.key});

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  final TextEditingController _useremailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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
                "Welcome Back !",
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
            ),
            userInputs(controller: _useremailController, labelText: 'Email'),
            userInputs(controller: _passwordController, labelText: 'Password'),
            SizedBox(height: 25),
            OrangeButton(onPressed: (){}, buttonText: 'Login'),
            SizedBox(height: 20),
            signInmethods(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an account"),
                TextButton(
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>signupScreen()));
                    },
                    child: Text(
                        'Sign Up',
                      style: TextStyle(
                        color: Color(0xffEFA885),
                        fontWeight: FontWeight.w900
                      ),
                    )
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class OrangeButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonText;

  const OrangeButton({
    required this.onPressed,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      child: Material(
        elevation: 4,
        shadowColor: Colors.orangeAccent,
        borderRadius: BorderRadius.circular(25),
        color: Color(0xffEFA885),
        child: InkWell(
          onTap: onPressed,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 16),
            alignment: Alignment.center,
            child: Text(
              buttonText,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class userInputs extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;

  const userInputs({
    required this.controller,
    required this.labelText,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SizedBox(
      width: width * 0.87,
      child: TextField(
        controller:controller,
        decoration: InputDecoration(
          labelText: '  ' + labelText,
        ),
      ),
    );
  }
}

class signInmethods extends StatelessWidget {
  const signInmethods({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: width * 0.22,
              child: Divider(
                color: Colors.black,
                thickness: 1,
                height: 20,
              ),
            ),
            Text(
              ' Or sign In with ',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            SizedBox(
              width: width * 0.22,
              child: Divider(
                color: Colors.black,
                thickness: 1,
                height: 20,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        SizedBox(
          width: width/2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                  width: width/10,
                  child: IconButton
                    (onPressed: (){},
                      icon: Image(image: AssetImage('assets/google.png'),
                      )
                  )
              ),
              SizedBox(
                  width: width/10,
                  child: IconButton
                    (onPressed: (){},
                      icon: Image(image: AssetImage('assets/facebook.png'),
                      )
                  )
              ),
              SizedBox(
                  width: width/10,
                  child: IconButton
                    (onPressed: (){},
                      icon: Image(image: AssetImage('assets/apple.png'),
                      )
                  )
              ),
            ],
          ),
        ),
      ],
    );
  }
}


