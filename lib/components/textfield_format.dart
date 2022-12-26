// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seed/components/color.dart';

class TextfieldFormat extends StatefulWidget {
  final String? text;
  final String? helper;
  final String? label;
  final Color? focusTextFieldColor;
  final Color? borderColor;
  final Color? textFieldColor;
  final TextEditingController? controller;
  final Color? shadow;
  final Color? textColor;
  final Color? hintColor;
  final IconData? defaultIcon;
  final IconData? icon;
  final Color? iconColor;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;

  const TextfieldFormat({
    Key? key,
    this.text,
    this.controller,
    this.textFieldColor,
    this.shadow,
    this.textColor,
    this.hintColor,
    this.icon,
    this.iconColor,
    this.defaultIcon,
    this.keyboardType,
    this.validator,
    this.helper,
    this.label,
    this.focusTextFieldColor,
    this.borderColor,
  }) : super(key: key);

  @override
  State<TextfieldFormat> createState() => _TextfieldFormatState();
}

bool check = true;

class _TextfieldFormatState extends State<TextfieldFormat> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (BuildContext context, Widget? child) {
        return Padding(
          padding: EdgeInsets.only(top: 5.w, bottom: 5.w),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              boxShadow: [
                BoxShadow(
                  color: widget.shadow!,
                  blurRadius: 15,
                  offset: Offset(-5, 5),
                ),
              ],
            ),
            child: widget.icon != null && widget.defaultIcon != null
                ? TextFormField(
                    validator: widget.validator,
                    keyboardType: widget.keyboardType,
                    obscureText: check,
                    controller: widget.controller,
                    cursorColor: blueColor,
                    style: GoogleFonts.prompt(
                      height: 1.w,
                      fontSize: 14.w,
                      color: widget.textColor,
                    ),
                    decoration: InputDecoration(
                      labelText: ' ${widget.label}',
                      labelStyle: GoogleFonts.prompt(
                        color: whiteColor,
                        // backgroundColor: blueColor,
                      ),

                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      helperText: widget.helper,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: widget.focusTextFieldColor!,
                          width: 1.5.w,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: widget.borderColor!,
                          width: 1.w,
                        ),
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 15.w,
                        horizontal: 10.w,
                      ), //Change this value to custom as you like
                      // contentPadding: EdgeInsets.all(10.w),
                      filled: true,
                      fillColor: widget.textFieldColor,
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: widget.textFieldColor!,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      hintText: widget.text,
                      hintStyle: GoogleFonts.prompt(
                        color: widget.hintColor!,
                      ),
                      suffixIcon: Align(
                        widthFactor: 1.0,
                        heightFactor: 1.0,
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              check = !check;
                            });
                          },
                          child: check == true
                              ? Icon(
                                  widget.defaultIcon,
                                  color: widget.iconColor,
                                )
                              : Icon(
                                  widget.icon,
                                  color: widget.iconColor,
                                ),
                        ),
                      ),
                    ),
                  )
                : TextFormField(
                    validator: widget.validator,
                    keyboardType: widget.keyboardType,
                    obscureText: false,
                    controller: widget.controller,
                    cursorColor: blueColor,
                    style: GoogleFonts.prompt(
                      height: 1.w,
                      fontSize: 14.w,
                      color: widget.textColor,
                    ),
                    decoration: InputDecoration(
                      labelText: ' ${widget.label} ',
                      labelStyle: GoogleFonts.prompt(
                        color: whiteColor,
                        // backgroundColor: blueColor,
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      helperText: widget.helper,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: widget.focusTextFieldColor!,
                          width: 1.5.w,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: widget.borderColor!,
                          width: 1.w,
                        ),
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 15.w,
                        horizontal: 10.w,
                      ),
                      // contentPadding: EdgeInsets.all(10.w),
                      filled: true,
                      fillColor: widget.textFieldColor,
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: widget.textFieldColor!,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      hintText: widget.text,
                      hintStyle: GoogleFonts.prompt(
                        color: widget.hintColor!,
                      ),
                    ),
                  ),
          ),
        );
      },
    );
  }
}
