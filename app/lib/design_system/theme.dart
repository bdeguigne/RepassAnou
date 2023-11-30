import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:repasse_anou/design_system/responsive_utils.dart';

const Color success = Color(0xFF00C851);
const Color error = Color(0xFFff4444);
const Color black = Color(0xFF000000);
const Color blackVariant = Color(0xFF0D101C);
const Color lightBlack = Color(0xFF191D31);
const Color grey = Color(0xFF666666);
const Color greyInput = Color(0xFF9CA4AB);
const Color greyButton = Color(0xFFEEEEEE);
const Color navBarBackroundColor = Color(0xFEF6F6F6);
const Color navBarSelectedItemColor = Color(0xFE1D232E);
const Color navBarUnselectedItemColor = Color(0xFEDADADA);
const Color blue = Color(0x00007fff);
const Color hintText = Color(0xff6E7591);
const Color checkBoxBackgroundColor = Color(0xffD9D9D9);
const Color customBodyColor = Color(0xff0D101C);

TextStyle bodyLarge = TextStyle(
  fontSize: sp(14),
  fontWeight: FontWeight.w600,
  color: black,
  fontFamily: 'Nunito',
  overflow: TextOverflow.ellipsis,
);
TextStyle bodyMedium = TextStyle(
  fontSize: sp(12),
  fontWeight: FontWeight.w400,
  color: black,
  fontFamily: 'Nunito',
  overflow: TextOverflow.ellipsis,
);
TextStyle bodySmall = TextStyle(
  fontSize: sp(10.0),
  fontWeight: FontWeight.w500,
  color: black,
  fontFamily: 'Nunito',
);
TextStyle labelSmall = TextStyle(
  fontSize: sp(11.0),
  fontWeight: FontWeight.w400,
  color: grey,
  fontFamily: 'Nunito',
  overflow: TextOverflow.ellipsis,
);
TextStyle labelMedium = TextStyle(
  fontSize: sp(12.0),
  fontWeight: FontWeight.w400,
  color: grey,
  fontFamily: 'Nunito',
  overflow: TextOverflow.ellipsis,
);
TextStyle labelLarge = TextStyle(
  fontSize: sp(14.0),
  fontWeight: FontWeight.w400,
  color: grey,
  fontFamily: 'Nunito',
  overflow: TextOverflow.ellipsis,
);
TextStyle headlineLarge = TextStyle(
  fontSize: sp(16),
  fontWeight: FontWeight.w700,
  overflow: TextOverflow.ellipsis,
);
TextStyle headlineMedium = TextStyle(
  fontSize: sp(14),
  fontWeight: FontWeight.w600,
  overflow: TextOverflow.ellipsis,
);
TextStyle headlineSmall = TextStyle(
  fontSize: sp(14),
  fontWeight: FontWeight.w600,
  overflow: TextOverflow.ellipsis,
);
TextStyle displaySmall = TextStyle(
  fontSize: sp(11),
  fontWeight: FontWeight.w300,
  overflow: TextOverflow.ellipsis,
);
TextStyle displayLarge = TextStyle(
  fontSize: sp(14),
  fontWeight: FontWeight.w600,
  overflow: TextOverflow.ellipsis,
);
TextStyle displayMedium = TextStyle(
  fontSize: sp(14),
  fontWeight: FontWeight.w500,
  overflow: TextOverflow.ellipsis,
);
const titleMedium = TextStyle(color: Colors.white);

const appOutlineInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(
    Radius.circular(20),
  ),
  borderSide: BorderSide(
    color: Color(0xffDCE1EF), // Couleur de bordure
    width: 1, // Largeur de bordure
  ),
);

const appOutlineTransparentInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(
    Radius.circular(20),
  ),
  borderSide: BorderSide(
    color: Colors.transparent, // Couleur de bordure
    width: 0, // Largeur de bordure
  ),
);

final ThemeData appTheme = ThemeData(
  platform: TargetPlatform.iOS,
  useMaterial3: true,
  fontFamily: 'Poppins',
  pageTransitionsTheme: const PageTransitionsTheme(
    builders: {
      TargetPlatform.android: SharedAxisPageTransitionsBuilder(
          transitionType: SharedAxisTransitionType.horizontal),
      TargetPlatform.iOS: SharedAxisPageTransitionsBuilder(
          transitionType: SharedAxisTransitionType.horizontal),
    },
  ),
  splashColor: Colors.white24,
  textTheme: TextTheme(
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
  checkboxTheme: CheckboxThemeData(
    fillColor: MaterialStateProperty.all(Colors.black),
    checkColor: MaterialStateProperty.all(Colors.white),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.black,
      foregroundColor: Colors.white,
      textStyle: headlineLarge,
    ),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: navBarBackroundColor,
    selectedItemColor: navBarSelectedItemColor,
    unselectedIconTheme: IconThemeData(
      color: navBarUnselectedItemColor,
    ),
  ),
  inputDecorationTheme: const InputDecorationTheme(
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(20),
      ),
      borderSide: BorderSide(
        color: error,
        width: 1,
      ),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(20),
      ),
      borderSide: BorderSide(
        color: error,
        width: 1,
      ),
    ),
    errorStyle: TextStyle(
      color: error,
      fontSize: 10,
      fontWeight: FontWeight.w500,
    ),
  ),
  dropdownMenuTheme: DropdownMenuThemeData(
    textStyle: bodyMedium,
    inputDecorationTheme: const InputDecorationTheme(
      border: OutlineInputBorder(
        borderSide: BorderSide(
          color: greyInput,
          width: 1,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: greyInput,
          width: 1,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: greyInput,
          width: 1,
        ),
      ),
    ),
  ),
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

  Text get headlineMediumLightBlack {
    return Text(
      data!,
      textScaleFactor: 1,
      textAlign: textAlign,
      style: appTheme.textTheme.headlineMedium?.copyWith(color: lightBlack),
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

  Text get headlineLargeWhite {
    return Text(
      data!,
      textScaleFactor: 1,
      textAlign: textAlign,
      style: appTheme.textTheme.headlineLarge?.copyWith(color: Colors.white),
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
