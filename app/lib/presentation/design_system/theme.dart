import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

const Color success = Color(0xFF00C851);
const Color error = Color(0xFFff4444);
const Color black = Color(0xFF000000);
const Color grey = Color(0xFF666666);
const Color greyInput = Color(0xFF9CA4AB);
const Color greyButton = Color(0xFFEEEEEE);
const Color navBarBackroundColor = Color(0xFEF6F6F6);
const Color navBarSelectedItemColor = Color(0xFE1D232E);
const Color navBarUnselectedItemColor = Color(0xFEDADADA);
const Color blue = Color(0x00007fff);

const bodyLarge = TextStyle(
  fontSize: 12,
  fontWeight: FontWeight.w700,
  color: black,
  fontFamily: 'Nunito',
);
const bodyMedium = TextStyle(
  fontSize: 12,
  fontWeight: FontWeight.w500,
  color: black,
  fontFamily: 'Nunito',
);
const bodySmall = TextStyle(
  fontSize: 10.0,
  fontWeight: FontWeight.w500,
  color: black,
  fontFamily: 'Nunito',
);
const labelSmall = TextStyle(
  fontSize: 11.0,
  fontWeight: FontWeight.w400,
  color: grey,
  fontFamily: 'Nunito',
);
const labelMedium = TextStyle(
  fontSize: 12.0,
  fontWeight: FontWeight.w400,
  color: grey,
  fontFamily: 'Nunito',
);
const labelLarge = TextStyle(fontSize: 13.0, fontWeight: FontWeight.w400);
const headlineLarge = TextStyle(fontSize: 16, fontWeight: FontWeight.w600);
const headlineMedium = TextStyle(fontSize: 14, fontWeight: FontWeight.w700);
const headlineSmall = TextStyle(fontSize: 14, fontWeight: FontWeight.w600);
const displaySmall = TextStyle(fontSize: 11, fontWeight: FontWeight.w300);
const displayLarge = TextStyle(fontSize: 14, fontWeight: FontWeight.w600);
const displayMedium = TextStyle(fontSize: 14, fontWeight: FontWeight.w500);
const titleMedium = TextStyle(color: Colors.white);

final ThemeData appTheme = ThemeData(
  platform: TargetPlatform.iOS,
  useMaterial3: true,
  fontFamily: 'Poppins',
  pageTransitionsTheme: const PageTransitionsTheme(
    builders: {
      TargetPlatform.android: FadeThroughPageTransitionsBuilder(),
      TargetPlatform.iOS: OpenUpwardsPageTransitionsBuilder(),
    },
  ),
  textTheme: const TextTheme(
    bodyLarge: bodyLarge,
    bodyMedium: bodyMedium,
    bodySmall: bodySmall,
    labelSmall: labelSmall,
    labelMedium: labelMedium,
    labelLarge: labelLarge,
    headlineLarge: headlineLarge,
    headlineMedium: headlineMedium,
    headlineSmall: headlineSmall,
    displaySmall: displaySmall,
    displayLarge: displayLarge,
    displayMedium: displayMedium,
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: navBarBackroundColor,
      selectedItemColor: navBarSelectedItemColor,
      unselectedIconTheme: IconThemeData(
        color: navBarUnselectedItemColor,
      )),
);

extension FlumiTextExtension on Text {
  Text get bodyLarge {
    return Text(
      data!,
      textScaleFactor: 1,
      textAlign: textAlign,
      style: appTheme.textTheme.bodyLarge,
    );
  }

  Text get bodyMedium {
    return Text(
      data!,
      textScaleFactor: 1,
      textAlign: textAlign,
      style: appTheme.textTheme.bodyMedium,
    );
  }

  Text get bodySmall {
    return Text(
      data!,
      textScaleFactor: 1,
      textAlign: textAlign,
      style: appTheme.textTheme.bodySmall,
    );
  }

  Text get labelSmall {
    return Text(
      data!,
      textScaleFactor: 1,
      textAlign: textAlign,
      style: appTheme.textTheme.labelSmall,
    );
  }

  Text get labelMedium {
    return Text(
      data!,
      textScaleFactor: 1,
      textAlign: textAlign,
      style: appTheme.textTheme.labelMedium,
    );
  }

  Text get labelLarge {
    return Text(
      data!,
      textScaleFactor: 1,
      textAlign: textAlign,
      style: appTheme.textTheme.labelLarge,
    );
  }

  Text get headlineSmall {
    return Text(
      data!,
      textScaleFactor: 1,
      textAlign: textAlign,
      style: appTheme.textTheme.headlineSmall,
    );
  }

  Text get headlineMedium {
    return Text(
      data!,
      textScaleFactor: 1,
      textAlign: textAlign,
      style: appTheme.textTheme.headlineMedium,
    );
  }

  Text get headlineLarge {
    return Text(
      data!,
      textScaleFactor: 1,
      textAlign: textAlign,
      style: appTheme.textTheme.headlineLarge,
    );
  }

  Text get displaySmall {
    return Text(
      data!,
      textScaleFactor: 1,
      textAlign: textAlign,
      style: appTheme.textTheme.displaySmall,
    );
  }

  Text get displayMedium {
    return Text(
      data!,
      textScaleFactor: 1,
      textAlign: textAlign,
      style: appTheme.textTheme.displayMedium,
    );
  }

  Text get displayLarge {
    return Text(
      data!,
      textScaleFactor: 1,
      textAlign: textAlign,
      style: appTheme.textTheme.displayLarge,
    );
  }
}

extension FlumiTextStyleExtension on TextStyle {
  TextStyle customColor(Color color) {
    return copyWith(color: color);
  }

  TextStyle get whiteColor {
    return copyWith(color: Colors.white);
  }

  TextStyle get blackColor {
    return copyWith(color: Colors.black);
  }

  TextStyle get greyColor {
    return copyWith(color: grey);
  }

  TextStyle get greyInputColor {
    return copyWith(color: greyInput);
  }
}
