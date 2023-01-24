import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:instagram_clone/resources/auth_methods.dart';
import 'package:instagram_clone/utils/colors.dart';
import 'package:instagram_clone/widgets/text_field_input.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordConreoller = TextEditingController();
  final TextEditingController _bioConreoller = TextEditingController();
  final TextEditingController _usernameConreoller = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordConreoller.dispose();
    _bioConreoller.dispose();
    _usernameConreoller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          width: double.infinity,
          child: SingleChildScrollView(
            child: SizedBox(
              width: double.infinity,
              height: 700,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // SVG image
                  SvgPicture.asset(
                    'assets/ic_instagram.svg',
                    color: primaryColor,
                    height: 64,
                  ),
                  const SizedBox(
                    height: 64,
                  ),
                  //ciecular widget toaccept andshow our selecter file
                  Stack(
                    children: [
                      const CircleAvatar(
                        radius: 64,
                        backgroundImage: NetworkImage(
                            "https://images.unsplash.com/photo-1674388725660-7727411a47e4?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80"),
                      ),
                      Positioned(
                          bottom: -12,
                          left: 80,
                          child: IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.add_a_photo)))
                    ],
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  // text field inputfro username
                  TextFeldInput(
                    textEditingController: _usernameConreoller,
                    hintText: 'Enter your name',
                    textInputType: TextInputType.emailAddress,
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  // text feld input  for email
                  TextFeldInput(
                    textEditingController: _emailController,
                    hintText: 'Enter your email',
                    textInputType: TextInputType.emailAddress,
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  // text feld input  for password
                  TextFeldInput(
                    textEditingController: _passwordConreoller,
                    hintText: 'Enter your Password',
                    textInputType: TextInputType.text,
                    isPass: true,
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  TextFeldInput(
                    textEditingController: _bioConreoller,
                    hintText: 'Enter your bio',
                    textInputType: TextInputType.emailAddress,
                  ),
                  const SizedBox(
                    height: 24,
                  ),

                  InkWell(
                    onTap: () async {
                      String res = await AuthMethods().signUpUser(
                        email: _emailController.text.trim(),
                        password: _passwordConreoller.text.trim(),
                        username: _usernameConreoller.text.trim(),
                        bio: _bioConreoller.text.trim(),
                      );
                      print(res);
                    },
                    child: Container(
                      width: double.infinity,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      decoration: const ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(4),
                          ),
                        ),
                        color: blueColor,
                      ),
                      child: const Text('Sign in'),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Flexible(
                    flex: 2,
                    child: Container(),
                  ),
                  //Transitioning tosigning up
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 8,
                        ),
                        child: const Text('Dont have an account?'),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 8,
                          ),
                          child: const Text(
                            'Sign up',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
