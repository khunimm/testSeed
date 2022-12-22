import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FontFormat extends StatelessWidget {
  final String? text;
  final double? size;
  final int? line;
  final double? height;
  final TextAlign? align;
  final Color? textColor;
  final FontWeight? weight;
  final TextOverflow? overflow;
  final bool? softWrap;
  final double? letterSpacing;
  final TextDecoration? decoration;

  const FontFormat({
    Key? key,
    this.text,
    this.size,
    this.textColor,
    this.weight,
    this.line,
    this.overflow,
    this.softWrap,
    this.letterSpacing,
    this.height,
    this.align,
    this.decoration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text.toString(),
      style: GoogleFonts.prompt(
        fontSize: size,
        color: textColor,
        fontWeight: weight,
        letterSpacing: letterSpacing,
        height: height,
        decoration: decoration,
        decorationThickness: 2
      ),
      textAlign: align,
      maxLines: line,
      overflow: overflow,
      softWrap: softWrap,
    );
  }
}
