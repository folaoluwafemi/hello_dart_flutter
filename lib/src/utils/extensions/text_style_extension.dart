part of 'extensions.dart';

extension TextStyleExtension on TextStyle {
  TextStyle get withTextBlack => copyWith(color: Colors.black87);

  TextStyle get withBlack => copyWith(color: Colors.black);

  TextStyle get withWhite => copyWith(color: Colors.white);

  TextStyle get withMediumWeight => copyWith(fontWeight: FontWeight.w500);

  TextStyle withSize(double fontSize) => copyWith(fontSize: fontSize);

  TextStyle withColor(Color color) => copyWith(color: color);
}
