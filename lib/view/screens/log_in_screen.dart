import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:serv5_task/view/screens/albums_screen.dart';
import 'package:serv5_task/view/widgets/custom_button.dart';
import 'package:serv5_task/view/widgets/input_field.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.1, vertical: screenHeight * 0.06),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Image.network(
                    'https://media.istockphoto.com/id/1281150061/vector/register-account-submit-access-login-password-username-internet-online-website-concept.jpg?s=612x612&w=0&k=20&c=9HWSuA9IaU4o-CK6fALBS5eaO1ubnsM08EOYwgbwGBo=',
                    height: screenHeight * 0.25,
                    width: screenWidth * 0.7,
                  ),
                ),
                const Text(
                  'LOGIN',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.02,
                ),
                const InputField(
                  title: 'Email',
                  hint: 'Enter your Email',
                ),
                const InputField(
                  title: 'Password',
                  hint: 'Enter your Password',
                ),
                SizedBox(
                  height: screenHeight * 0.04,
                ),
                Align(
                  alignment: Alignment.center,
                  child: CustomButton(
                    onTap: () {
                      Navigator.of(context).pushAndRemoveUntil(
                          CupertinoPageRoute(
                            builder: (context) => const AlbumsScreen(),
                          ),
                          (route) => false);
                    },
                    title: 'LogIn',
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.03,
                ),
                const Divider(
                  height: 5,
                  color: Colors.grey,
                ),
                SizedBox(
                  height: screenHeight * 0.03,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Don\'t have an account?',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Register Now',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
