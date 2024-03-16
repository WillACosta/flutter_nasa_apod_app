import 'package:core_dependencies/google_fonts.dart';
import 'package:flutter/widgets.dart';

class ApodText extends StatelessWidget {
  final double fontSize;

  final String text;
  final FontWeight fontWeight;
  final Color color;
  final TextAlign textAlign;
  final bool? softWrap;

  const ApodText.bodySmallest(
    this.text, {
    super.key,
    this.fontSize = 12,
    this.color = const Color(0XFF000000),
    this.fontWeight = FontWeight.normal,
    this.textAlign = TextAlign.start,
    this.softWrap,
  });

  const ApodText.bodySmall(
    this.text, {
    super.key,
    this.fontSize = 14,
    this.color = const Color(0XFF000000),
    this.fontWeight = FontWeight.normal,
    this.textAlign = TextAlign.start,
    this.softWrap,
  });

  const ApodText.body(
    this.text, {
    super.key,
    this.fontSize = 16,
    this.color = const Color(0XFF000000),
    this.fontWeight = FontWeight.normal,
    this.textAlign = TextAlign.start,
    this.softWrap,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      softWrap: softWrap,
      style: GoogleFonts.poppins(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }
}
