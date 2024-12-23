import 'package:chat_app/constants.dart';
import 'package:chat_app/helper/show_snack_bar.dart';
import 'package:chat_app/screens/chat_screen.dart';
import 'package:chat_app/screens/register_screen.dart';
import 'package:chat_app/widgets/custom_button.dart';
import 'package:chat_app/widgets/custom_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  static String id = 'loginScreen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String? email;
  String? password;

  GlobalKey<FormState> formKey = GlobalKey();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Form(
            key: formKey,
            child: ListView(
              children: [
                const SizedBox(height: 75),
                Image.asset(
                  kLogo,
                  height: 100,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Scholar Chat',
                      style: TextStyle(
                          fontSize: 32,
                          fontFamily: 'Pacifico',
                          color: kSecondaryColor),
                    ),
                  ],
                ),
                const SizedBox(height: 75),
                const Row(
                  children: [
                    Text(
                      'Sign In',
                      style: TextStyle(fontSize: 24, color: kSecondaryColor),
                    ),
                  ],
                ),
                const SizedBox(height: 25),
                CustomTextField(
                  onChanged: (data) {
                    email = data;
                  },
                  hintText: 'Email',
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  obscureText: true,
                  onChanged: (data) {
                    password = data;
                  },
                  hintText: 'Password',
                ),
                const SizedBox(height: 25),
                CustomButton(
                    onTap: () async {
                      if (formKey.currentState!.validate()) {
                        isLoading = true;
                        setState(() {});
                        try {
                          await loginUser();
                          // ignore: use_build_context_synchronously
                          Navigator.pushNamed(context, ChatScreen.id,
                              arguments: email);
                        } on FirebaseAuthException {
                          // ignore: use_build_context_synchronously
                          showSnackBar(context,
                              message: 'Wrong Password or Email.');
                        } catch (e) {
                          // ignore: avoid_print
                          print(e);
                        }
                        isLoading = false;
                        setState(() {});
                      }
                    },
                    text: 'Sign In'),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'don\'t have an account?',
                      style: TextStyle(color: kSecondaryColor),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, RegisterScreen.id);
                      },
                      child: const Text(
                        '  SignUp',
                        style: TextStyle(color: Color(0xFFC7EDE6)),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> loginUser() async {
    // ignore: unused_local_variable
    UserCredential user =
        await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email!,
      password: password!,
    );
  }
}
