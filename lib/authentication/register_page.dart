import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ta_dncc/authentication/login_page.dart';
import 'package:with_space_between/with_space_between.dart';

import '../navigation/navigation.dart';
import '../reuse_widget/textfield.dart';
import '../ui/colors.dart';
import '../ui/typography.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController controllerUsername = TextEditingController();
  final TextEditingController controllerEmail = TextEditingController();
  final TextEditingController controllerPassword = TextEditingController();

  bool isActive = false;

  String? usernameError;
  String? emailError;
  String? passwordError;

  bool get isValidUsername => controllerUsername.text.trim().length >= 3;
  bool get isValidEmail => RegExp(
    r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$",
  ).hasMatch(controllerEmail.text);
  bool get isValidPassword => controllerPassword.text.length >= 8;

  @override
  void initState() {
    super.initState();
    controllerUsername.addListener(_validateInput);
    controllerEmail.addListener(_validateInput);
    controllerPassword.addListener(_validateInput);
  }

  @override
  void dispose() {
    controllerUsername.removeListener(_validateInput);
    controllerEmail.removeListener(_validateInput);
    controllerPassword.removeListener(_validateInput);
    controllerUsername.dispose();
    controllerEmail.dispose();
    controllerPassword.dispose();
    super.dispose();
  }

  void _validateInput() {
    setState(() {
      usernameError = isValidUsername
          ? null
          : "Username must be at least 3 characters long";
      emailError = isValidEmail ? null : "Invalid email!";
      passwordError = isValidPassword
          ? null
          : "Password must be at least 8 characters long";

      isActive = isValidUsername && isValidEmail && isValidPassword;
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
                      "Create Account",
                      style: mSemiBold.copyWith(color: textDark),
                    ),
                    Text(
                      "Create an account so you can explore all the existing jobs",
                      style: xsSemiBold.copyWith(color: textDark),
                      maxLines: 2,
                      textAlign: TextAlign.center,
                    ),
                  ].withSpaceBetween(height: 20),
                ),

                // Username
                myTextField(
                  labelText: "Username",
                  controller: controllerUsername,
                ),
                if (usernameError != null)
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      usernameError!,
                      style: xsRegular.copyWith(color: buttonFav),
                    ),
                  ),

                // Email
                myTextField(
                  labelText: "Email",
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

                // Password
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

                // Tombol Sign Up
                CustomButton(
                  isActive: isActive,
                  title: "Sign Up",
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NavigationScreen(),
                      ),
                    );
                  },
                ),

                // Sudah punya akun?
                Center(
                  child: RichText(
                    textAlign: TextAlign.left,
                    text: TextSpan(
                      text: "Already have an account? ",
                      style: xsMedium.copyWith(color: textDark),
                      children: [
                        TextSpan(
                          text: "Login",
                          style: xsSemiBold.copyWith(color: blue),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const LoginPage(),
                                ),
                              );
                            },
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 10),
                Text(
                  "Or continue with",
                  style: xsSemiBold.copyWith(color: blue),
                ),

                // Login via sosial media
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
