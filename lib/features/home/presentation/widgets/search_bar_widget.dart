import 'package:doctor_hunt/core/utils/color.dart';
import 'package:flutter/material.dart';

class SearchTextField extends StatefulWidget {
  const SearchTextField({
    super.key,
    required this.controller,
    this.validator,
    this.hintText,
  });

  final TextEditingController controller;
  final String? Function(String?)? validator;
  final String? hintText;

  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      height: screenHeight * 0.0665,
      width: screenWidth - (screenWidth * 0.106),
      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius: BorderRadius.circular(6),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 20,
            offset: const Offset(0, 4),
          ),
        ],
      ),

      child: TextFormField(
        controller: widget.controller,
        validator: widget.validator,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          focusedErrorBorder: InputBorder.none,
          fillColor: Colors.white,
          filled: true,
          isDense: true,
          prefixIcon: Padding(
            padding: EdgeInsets.all(screenWidth * 0.03),

            child: Icon(
              Icons.search,
              size: screenWidth * 0.05,
              color: AppColor.blue,
            ),
          ),
          hintText: widget.hintText,
          contentPadding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.032,
            vertical: 0,
          ),
          hintStyle: TextStyle(
            color: AppColor.blue,
            fontSize: screenWidth * 0.04,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
