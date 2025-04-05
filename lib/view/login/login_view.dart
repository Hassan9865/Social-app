import 'package:flutter/material.dart';
import 'package:social_app/components/button.dart';
import 'package:social_app/components/textfeild.dart';
import 'package:social_app/view/login/login_viewModel.dart';
import 'package:stacked/stacked.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    return ViewModelBuilder.reactive(
        viewModelBuilder: () => LoginViewModel(),
        builder: (context, viewModel, child) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Colors.grey[100],
            body: SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: size.height * 0.05),
                      // Logo Section
                      _buildLogoSection(size),
                      SizedBox(height: size.height * 0.03),

                      // Title
                      Text(
                        "Welcome to Social App",
                        style: theme.textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue[800],
                        ),
                      ),
                      SizedBox(height: size.height * 0.03),

                      // Form Section
                      _buildSignupForm(viewModel, size, theme),
                      SizedBox(height: size.height * 0.03),

                      // Sign Up Button
                      MyButton(
                        onTap: () {
                          viewModel.NavigateToBottomBar();
                        },
                        text: "LogIn",
                      ),
                      SizedBox(height: size.height * 0.02),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Dont have an account? "),
                          GestureDetector(
                            onTap: viewModel.NavigateToSignup,
                            child: Text(
                              "Sign up",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.blue[700],
                              ),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: size.height * 0.03),

                      _buildDivider(),
                      SizedBox(height: size.height * 0.03),

                      _buildGoogleSignIn(size),
                      SizedBox(height: size.height * 0.05),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}

Widget _buildLogoSection(Size size) {
  return Container(
    padding: EdgeInsets.all(20),
    decoration: BoxDecoration(
      color: Colors.blue[50],
      shape: BoxShape.circle,
    ),
    child: Icon(
      Icons.camera_alt_outlined,
      color: Colors.blue[700],
      size: size.height * 0.1,
    ),
  );
}

Widget _buildSignupForm(LoginViewModel viewModel, Size size, ThemeData theme) {
  return Column(
    children: [
      MyTextFeid(
        controller: viewModel.emailcontroller,
        hintText: "Email Address",
        obscureText: false,
        prefixIcon: Icon(Icons.email_outlined),
      ),
      SizedBox(height: size.height * 0.02),
      MyTextFeid(
        controller: viewModel.passwordcontroller,
        hintText: "Password",
        obscureText: true,
        prefixIcon: Icon(Icons.lock_outline),
      ),
    ],
  );
}

Widget _buildDivider() {
  return Row(
    children: [
      Expanded(
        child: Divider(
          thickness: 1,
          color: Colors.grey[400],
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Text(
          "OR",
          style: TextStyle(color: Colors.grey[600]),
        ),
      ),
      Expanded(
        child: Divider(
          thickness: 1,
          color: Colors.grey[400],
        ),
      ),
    ],
  );
}

Widget _buildGoogleSignIn(Size size) {
  return OutlinedButton(
    onPressed: () {},
    style: OutlinedButton.styleFrom(
      padding: EdgeInsets.symmetric(vertical: 12),
      minimumSize: Size(size.width * 0.7, 50),
      side: BorderSide(color: Colors.grey[400]!),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          "assets/images/google.png",
          height: 24,
          width: 24,
        ),
        SizedBox(width: 10),
        Text(
          "Sign in with Google",
          style: TextStyle(
            color: Colors.grey[800],
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    ),
  );
}
