import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ta_dncc/authentication/register_page.dart';
import 'package:ta_dncc/navigation/navigation.dart';
import 'package:with_space_between/with_space_between.dart';

import '../reuse_widget/textfield.dart';
import '../ui/colors.dart';
import '../ui/typography.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController controllerEmail = TextEditingController();
  final TextEditingController controllerPassword = TextEditingController();

  bool isActive = false;
  String? emailError;
  String? passwordError;

  bool get isValidPassword => controllerPassword.text.length >= 8;
  bool get isValidEmail => RegExp(
    r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$",
  ).hasMatch(controllerEmail.text) || controllerEmail.text.length >= 5;

  @override
  void initState() {
    super.initState();
    controllerEmail.addListener(_validateEmailPassword);
    controllerPassword.addListener(_validateEmailPassword);
  }

  @override
  void dispose() {
    controllerEmail.removeListener(_validateEmailPassword);
    controllerPassword.removeListener(_validateEmailPassword);
    controllerEmail.dispose();
    controllerPassword.dispose();
    super.dispose();
  }

  void _validateEmailPassword() {
    setState(() {
      emailError = isValidEmail ? null : "Invalid email or username!";
      passwordError = isValidPassword
          ? null
          : "Password must be at least 8 characters long";
      isActive = isValidEmail && isValidPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Login here",
                      style: mSemiBold.copyWith(color: textDark),
                    ),
                    Text(
                      "Welcome back you've been missed",
                      style: xsSemiBold.copyWith(color: textDark),
                      textAlign: TextAlign.center,
                    ),
                  ].withSpaceBetween(height: 20),
                ),
                myTextField(
                  labelText: "Email atau Username",
                  controller: controllerEmail,
                  keyboardType: TextInputType.emailAddress,
                ),
                if (emailError != null)
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      emailError!,
                      style: xsRegular.copyWith(color: buttonFav),
                    ),
                  ),
                myTextFieldPassword(
                  labelText: "Password",
                  isObscured: true,
                  controller: controllerPassword,
                ),
                if (passwordError != null)
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      passwordError!,
                      style: xsRegular.copyWith(color: buttonFav),
                    ),
                  ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "Forgot Password?",
                    style: xsRegular.copyWith(color: blue),
                  ),
                ),
                CustomButton(
                  isActive: isActive,
                  title: "Sign In",
                  onTap: () {
                    isActive
                        ? Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => NavigationScreen(),
                            ),
                          )
                        : () {};
                  },
                ),
                CustomButton(
                  isActive: false,
                  title: "Create New Account",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RegisterPage()),
                    );
                  },
                ),
                Text(
                  "Or continue with",
                  style: xsSemiBold.copyWith(color: blue),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: grey,
                      ),
                      child: SvgPicture.asset(
                        'assets/icons/ph_google-logo-bold.svg',
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: grey,
                      ),
                      child: SvgPicture.asset(
                        'assets/icons/ic_sharp-facebook.svg',
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: grey,
                      ),
                      child: SvgPicture.asset(
                        'assets/icons/ic_baseline-apple.svg',
                      ),
                    ),
                  ].withSpaceBetween(width: 10),
                ),
              ].withSpaceBetween(height: 20),
            ),
          ),
        ),
      ),
    );
  }
}
