import 'package:chat_app/constants.dart';
import 'package:chat_app/helper/show_snack_bar.dart';
import 'package:chat_app/screens/chat_screen.dart';
import 'package:chat_app/widgets/custom_button.dart';
import 'package:chat_app/widgets/custom_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

// ignore: must_be_immutable
class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  static String id = 'registerScreen';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
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
                      'Register',
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
                          await registerUser();
                          // ignore: use_build_context_synchronously
                          Navigator.pushNamed(context, ChatScreen.id,
                              arguments: email);
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'weak-password') {
                            // ignore: use_build_context_synchronously
                            showSnackBar(context,
                                message:
                                    'Password should be at least 6 characters');
                          } else if (e.code == 'email-already-in-use') {
                            // ignore: use_build_context_synchronously
                            showSnackBar(context,
                                message: 'The account already exists');
                          }
                        } catch (e) {
                          // ignore: avoid_print
                          print(e);
                        }
                        isLoading = false;
                        setState(() {});
                      } else {
                        //! you can add here what should happended if the validation returns false
                      }
                    },
                    text: 'Register'),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'already have an account',
                      style: TextStyle(color: kSecondaryColor),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        '  SignIn',
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

  Future<void> registerUser() async {
    // ignore: unused_local_variable
    UserCredential user = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email!, password: password!);
  }
}
