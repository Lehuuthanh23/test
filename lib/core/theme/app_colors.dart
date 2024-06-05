part of '../core.dart';

class AppColors {
  final Color primaryOrange;
  final Color backgroundColor;
  final Color primaryColor;
  final Color connectionColor;
  final Color disconnectionColor;

  const AppColors({
    required this.primaryOrange,
    required this.backgroundColor,
    required this.primaryColor,
    required this.connectionColor,
    required this.disconnectionColor,
  });
  factory AppColors.light() {
    const gradientBackgroundColor = LinearGradient(
      colors: [
        Color(0xFFFABD1D),
        Color(0xFFEB6E2C),
      ],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    );
    const gradientPrimaryColor = LinearGradient(
      colors: [
        Color(0xFFFABD1D),
        Color(0xFFEB6E2C),
      ],
      begin: Alignment.centerRight,
      end: Alignment.centerLeft,
    );
    final shaderBackgroundColor = gradientBackgroundColor.createShader(
      const Rect.fromLTWH(0.0, 0.0, 100.0, 100.0),
    );
    final shaderPrimaryColor = gradientPrimaryColor.createShader(
      const Rect.fromLTWH(0.0, 0.0, 100.0, 100.0),
    );
    final backgroundColor = Color(shaderBackgroundColor.hashCode);
    final primaryColor = Color(shaderPrimaryColor.hashCode);

    return AppColors(
      primaryOrange: const Color(0xffEB6E2C),
      backgroundColor: backgroundColor,
      primaryColor: gradientPrimaryColor.colors.last,
      connectionColor: const Color(0xFF027800),
      disconnectionColor: const Color(0xFF027800),
    );
  }

  // factory AppColors.dark() {
  //   return const AppColors(
  //     primaryOrange: Color(0xffEB6E2C),
  //   );
  // }
}
