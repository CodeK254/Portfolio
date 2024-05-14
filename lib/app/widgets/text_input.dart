// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextInput extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hintText;
  final String? Function(String?)? validator;
  final TextInputType keyBoardInput;
  Iterable<String>? autofillHints;
  TextCapitalization? textCapitalization;
  int? maxLines;
  int? maxLength;
  EdgeInsetsGeometry? padding;
  CustomTextInput({
    super.key, 
    required this.controller, 
    required this.label, 
    required this.hintText, 
    required this.validator, 
    this.maxLines, 
    required this.keyBoardInput, 
    this.autofillHints, 
    this.textCapitalization,
    this.maxLength,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: MediaQuery.of(context).size.height * 0.015,
      ),
      child: TextFormField(
        validator: validator,
        controller: controller,
        maxLines: maxLines ?? 1,
        keyboardType: keyBoardInput,
        autofillHints: autofillHints ?? [],
        maxLength: maxLength,
        textCapitalization: textCapitalization ?? TextCapitalization.none,
        style: GoogleFonts.ubuntu(
          fontSize: 15,
          color: Colors.black,
        ),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: hintText,
          hintStyle: Theme.of(context).textTheme.displayMedium!.copyWith(
            color: Colors.grey.shade400,
            fontSize: 15,
          ),
          label: Text(
            label,
            style: Theme.of(context).textTheme.displaySmall,
          ),
          contentPadding: padding ?? const EdgeInsets.symmetric(
            horizontal: 12,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(
              color: Colors.grey.shade400,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(
              color: Colors.grey.shade400,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(
              color: Colors.blue.shade400,
            ),
          ),
        ),
      ),
    );
  }
}