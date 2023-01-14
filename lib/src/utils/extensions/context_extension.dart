part of 'extensions.dart';

extension ContextExtension on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  double get verticalViewPadding => mediaQuery.viewPadding.vertical;

  Size get queryScreenSize => mediaQuery.size;

  double get screenHeight => queryScreenSize.height;

  double get screenWidth => queryScreenSize.width;

  ThemeData get theme => Theme.of(this);

  ColorScheme get colorScheme => theme.colorScheme;

  Color get scaffoldBackgroundColor => theme.scaffoldBackgroundColor;

  Color get backgroundColor => theme.backgroundColor;

  NavigatorState get navigator => Navigator.of(this);
}
