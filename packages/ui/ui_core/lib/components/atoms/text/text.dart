import 'package:flutter/widgets.dart';

class ApodText extends StatelessWidget {
  final double fontSize;

  final String text;
  final FontWeight fontWeight;
  final Color color;
  final TextAlign textAlign;
  final bool? softWrap;
  final TextOverflow? overflow;

  const ApodText.bodySmallest(
    this.text, {
    super.key,
    this.fontSize = 12,
    this.color = const Color(0XFF000000),
    this.fontWeight = FontWeight.normal,
    this.textAlign = TextAlign.start,
    this.softWrap,
    this.overflow,
  });

  const ApodText.bodySmall(
    this.text, {
    super.key,
    this.fontSize = 14,
    this.color = const Color(0XFF000000),
    this.fontWeight = FontWeight.normal,
    this.textAlign = TextAlign.start,
    this.softWrap,
    this.overflow,
  });

  const ApodText.body(
    this.text, {
    super.key,
    this.fontSize = 16,
    this.color = const Color(0XFF000000),
    this.fontWeight = FontWeight.normal,
    this.textAlign = TextAlign.start,
    this.softWrap,
    this.overflow,
  });

  const ApodText.bodyHead(
    this.text, {
    super.key,
    this.fontSize = 18,
    this.color = const Color(0XFF000000),
    this.fontWeight = FontWeight.bold,
    this.textAlign = TextAlign.start,
    this.softWrap,
    this.overflow,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      softWrap: softWrap,
      overflow: overflow,
      style: TextStyle(
        fontFamily: 'Poppins',
        package: 'core_ui',
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }
}
