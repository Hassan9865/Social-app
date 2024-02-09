import 'package:flutter/material.dart';
import 'package:social_app/components/button.dart';
import 'package:social_app/components/textfeild.dart';
import 'package:social_app/view/signup/signup_view_model.dart';
import 'package:stacked/stacked.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailcontroller = TextEditingController();
    TextEditingController passwordcontroller = TextEditingController();
    TextEditingController namecontroller = TextEditingController();
    return ViewModelBuilder.reactive(
        viewModelBuilder: () => SignUpViewModel(),
        builder: (context, viewModel, child) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Colors.grey[300],
            body: SafeArea(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.camera_alt_outlined,
                        color: Colors.blueAccent,
                        size: 100,
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      const Text(
                        "welcome to Socail app",
                        style: TextStyle(fontSize: 22),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      MyTextFeid(
                          controller: namecontroller,
                          hintText: "Name",
                          obscureText: false),
                      const SizedBox(
                        height: 10,
                      ),
                      MyTextFeid(
                          controller: emailcontroller,
                          hintText: "Email",
                          obscureText: false),
                      const SizedBox(
                        height: 10,
                      ),
                      MyTextFeid(
                          controller: passwordcontroller,
                          hintText: "password",
                          obscureText: true),
                      const SizedBox(
                        height: 25,
                      ),
                      MyButton(onTap: () {}, text: "SignUp"),
                      const SizedBox(
                        height: 25,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Already as a member ?  "),
                          GestureDetector(
                            onTap: () {
                              viewModel.navigateToLogin();
                            },
                            child: const Text(
                              "Login",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
