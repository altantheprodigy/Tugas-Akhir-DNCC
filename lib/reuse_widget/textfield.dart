import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../ui/colors.dart';
import '../ui/typography.dart';

class myTextField extends StatefulWidget {
  const myTextField({
    super.key,
    this.isObscured = false,
    this.controller,
    this.maxLines,
    this.validator,
    this.keyboardType,
    this.backgroundColor = const Color(0xff222222),
    this.foregroundColor = const Color(0xffffffff),
    this.hintColor = const Color(0xffF2CE18),
    this.labelText = "",
    this.inputFormatter,
    this.onSubmitted,
    this.onChanged,
  });
  final bool isObscured;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final Color backgroundColor;
  final Color foregroundColor;
  final int? maxLines;
  final Color hintColor;
  final String labelText;
  final List<TextInputFormatter>? inputFormatter;
  final Function(String)? onSubmitted;
  final Function(String)? onChanged;

  @override
  myTextFieldState createState() => myTextFieldState();
}

class myTextFieldState extends State<myTextField> {
  bool isChecked = true;
  @override
  Widget build(BuildContext context) {
    return TextField(
      inputFormatters: widget.inputFormatter,
      keyboardType: widget.keyboardType,
      maxLines: widget.maxLines ?? null,
      autofocus: false,
      cursorColor: dark,
      style: TextStyle(
        color: textDark,
        fontSize: 12,
        fontFamily: 'Poppins',
        height: 1.2,
        letterSpacing: 0.5,
        fontWeight: FontWeight.w400,
      ),
      controller: widget.controller,
      textInputAction: TextInputAction.done,
      onSubmitted: widget.onSubmitted,
      onChanged: widget.onChanged,
      // obscureText: widget.isObscured ? isChecked : widget.isObscured,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 10,
        ),
        labelText: widget.labelText,
        labelStyle: TextStyle(
          color: textDark,
          fontSize: 12,
          fontFamily: 'Poppins',
          height: 1.2,
          letterSpacing: 0.5,
          fontWeight: FontWeight.w400,
        ),
        fillColor: background,
        filled: true,
        hintStyle: TextStyle(
          color: textDark,
          fontSize: 5,
          fontFamily: 'Poppins',
          height: 1.2,
          letterSpacing: 0.5,
          fontWeight: FontWeight.w400,
        ),
        suffixIcon: widget.isObscured
            ? Icon(Icons.search, size: 22, color: borderIconDark)
            : null,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: borderIconDark),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: borderIconDark),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}

class myTextFieldSearch extends StatefulWidget {
  const myTextFieldSearch({
    super.key,
    this.isObscured = false,
    this.controller,
    this.maxLines,
    this.validator,
    this.keyboardType,
    this.backgroundColor = const Color(0xff222222),
    this.foregroundColor = const Color(0xffffffff),
    this.hintColor = const Color(0xffF2CE18),
    this.labelText = "",
    this.inputFormatter,
    this.onSubmitted,
    this.onChanged,
  });
  final bool isObscured;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final Color backgroundColor;
  final Color foregroundColor;
  final int? maxLines;
  final Color hintColor;
  final String labelText;
  final List<TextInputFormatter>? inputFormatter;
  final Function(String)? onSubmitted;
  final Function(String)? onChanged;

  @override
  myTextFieldSearchState createState() => myTextFieldSearchState();
}

class myTextFieldSearchState extends State<myTextFieldSearch> {
  bool isChecked = true;
  @override
  Widget build(BuildContext context) {
    return TextField(
      inputFormatters: widget.inputFormatter,
      keyboardType: widget.keyboardType,
      maxLines: widget.maxLines ?? null,
      autofocus: false,
      cursorColor: dark,
      style: TextStyle(
        color: textDark,
        fontSize: 12,
        fontFamily: 'Poppins',
        height: 1.2,
        letterSpacing: 0.5,
        fontWeight: FontWeight.w400,
      ),
      controller: widget.controller,
      textInputAction: TextInputAction.done,
      onSubmitted: widget.onSubmitted,
      onChanged: widget.onChanged,
      // obscureText: widget.isObscured ? isChecked : widget.isObscured,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 10,
        ),
        labelText: widget.labelText,
        labelStyle: TextStyle(
          color: textDark,
          fontSize: 12,
          fontFamily: 'Poppins',
          height: 1.2,
          letterSpacing: 0.5,
          fontWeight: FontWeight.w400,
        ),
        fillColor: bgTxtSearch,
        filled: true,
        hintStyle: TextStyle(
          color: textDark,
          fontSize: 5,
          fontFamily: 'Poppins',
          height: 1.2,
          letterSpacing: 0.5,
          fontWeight: FontWeight.w400,
        ),
        suffixIcon: widget.isObscured
            ? Icon(Icons.search, size: 22, color: borderIconDark)
            : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide.none, // hilangkan garis
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide.none,
        ),

      ),
    );
  }
}

class myTextFieldPassword extends StatefulWidget {
  const myTextFieldPassword({
    super.key,
    this.isObscured = false,
    this.controller,
    this.maxLines,
    this.validator,
    this.keyboardType,
    this.backgroundColor = const Color(0xff222222),
    this.foregroundColor = const Color(0xffffffff),
    this.hintColor = const Color(0xffF2CE18),
    this.labelText = "",
    this.inputFormatter,
  });
  final bool isObscured;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final Color backgroundColor;
  final Color foregroundColor;
  final int? maxLines;
  final Color hintColor;
  final String labelText;
  final List<TextInputFormatter>? inputFormatter;

  @override
  myTextFieldPasswordState createState() => myTextFieldPasswordState();
}

class myTextFieldPasswordState extends State<myTextFieldPassword> {
  bool isChecked = true;
  @override
  Widget build(BuildContext context) {
    return TextField(
      inputFormatters: widget.inputFormatter,
      keyboardType: widget.keyboardType,
      // maxLines: widget.maxLines ?? null,
      autofocus: false,
      cursorColor: dark,
      style: TextStyle(
        color: textDark,
        fontSize: 12,
        fontFamily: 'Poppins',
        height: 1.2,
        letterSpacing: 0.5,
        fontWeight: FontWeight.w400,
      ),
      controller: widget.controller,
      textInputAction: TextInputAction.done,
      obscureText: widget.isObscured ? isChecked : widget.isObscured,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 10,
        ),
        labelText: widget.labelText,
        labelStyle: TextStyle(
          color: textDark,
          fontSize: 12,
          fontFamily: 'Poppins',
          height: 1.2,
          letterSpacing: 0.5,
          fontWeight: FontWeight.w400,
        ),
        fillColor: background,
        filled: true,
        hintStyle: TextStyle(
          color: textDark,
          fontSize: 5,
          fontFamily: 'Poppins',
          height: 1.2,
          letterSpacing: 0.5,
          fontWeight: FontWeight.w400,
        ),
        suffixIcon: widget.isObscured
            ? IconButton(
                icon: Icon(
                  // Based on passwordVisible state choose the icon
                  isChecked ? Icons.visibility : Icons.visibility_off,
                  color: borderIconDark,
                ),
                onPressed: () {
                  // Update the state i.e. toogle the state of passwordVisible variable
                  setState(() {
                    isChecked = !isChecked;
                  });
                },
              )
            : null,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: borderIconDark),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: borderIconDark),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final bool isActive;
  final String title;
  final VoidCallback onTap;
  CustomButton({
    super.key,
    required this.isActive,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          color: isActive ? dark : grey,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(title, style: sSemiBold.copyWith(color: isActive ? textWhite : dark)),
      ),
    );
  }
}
