import 'package:flutter/material.dart';
import 'package:social_app/components/button.dart';
import 'package:social_app/components/textfeild.dart';
import 'package:social_app/view/signup/signup_viewModel.dart';
import 'package:stacked/stacked.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
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
                        size: MediaQuery.of(context).size.height / 8,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 35,
                      ),
                      Text(
                        "welcome to Socail app",
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height / 30,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 30,
                      ),
                      MyTextFeid(
                          controller: viewModel.namecontroller,
                          hintText: "Name",
                          obscureText: false),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 70,
                      ),
                      MyTextFeid(
                          controller: viewModel.emailcontroller,
                          hintText: "Email",
                          obscureText: false),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 70,
                      ),
                      MyTextFeid(
                          controller: viewModel.passwordcontroller,
                          hintText: "password",
                          obscureText: true),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 35,
                      ),
                      MyButton(onTap: () {}, text: "SignUp"),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 50,
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
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 50,
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height / 25,
                        width: MediaQuery.of(context).size.width / 2,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset("assets/images/google.png"),
                            SizedBox(
                              width: 10,
                            ),
                            Text("SigIn in with Google"),
                          ],
                        ),
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
