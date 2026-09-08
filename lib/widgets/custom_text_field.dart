import 'package:doctor_hunt/core/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatefulWidget {
  CustomTextField({
    super.key,
    required this.controller,
    this.validator,
    required this.isPassword,
    this.hintText,
  });
  TextEditingController controller;
  String? Function(String?)? validator;
  final bool isPassword;
  final String? hintText;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48.h,
      child: TextFormField(
        obscureText: _obscureText,
        controller: widget.controller,
        validator: widget.validator,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFDEE2E6)),
          ),
          fillColor: Colors.white,
          filled: true,
          suffixIcon: widget.isPassword
              ? IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility_off : Icons.visibility,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                )
              : null,
          hintText: widget.hintText,
          contentPadding: EdgeInsets.fromLTRB(12.0, 14.0, 12.0, 14.0),

          hintStyle: TextStyle(
            color: AppColor.blue,
            fontSize: 16.sp,
            fontWeight: FontWeight.w300,
          ),
        ),
      ),
    );
  }
}
