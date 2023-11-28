// import 'package:core_kosmos/src/utils/platform.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:responsive_framework/responsive_framework.dart';

// /// {@category Utils}
// ///
// /// Permet de récupérer une value [T] en fonction de la taille de votre écran.
// T getResponsiveValue<T>(BuildContext context,
//         {required T defaultValue, T? desktop, T? tablet, T? phone}) =>
//     ResponsiveValue<T>(context, defaultValue: defaultValue, valueWhen: [
//       Condition.smallerThan(name: PHONE, value: phone ?? defaultValue),
//       Condition.smallerThan(name: TABLET, value: tablet ?? defaultValue),
//       Condition.smallerThan(name: DESKTOP, value: desktop ?? defaultValue),
//     ]).value ??
//     defaultValue;

// /// {@category Utils}
// ///
// /// Permet de créer une SizedBox responsive en [height]
// Widget sh(double value) =>
//     SizedBox(height: execInCaseOfPlatfom<double>(() => value, () => value.h));

// /// {@category Utils}
// ///
// /// Permet de créer un padding horizontal responsive
// EdgeInsetsGeometry pw(double value) => execInCaseOfPlatfom<EdgeInsetsGeometry>(
//     () => EdgeInsets.symmetric(horizontal: value),
//     () => EdgeInsets.symmetric(horizontal: value.w));

// /// {@category Utils}
// ///TODO DOC
// ///
// /// Permet de créer un padding vertical responsive
// EdgeInsetsGeometry ph(double value) => execInCaseOfPlatfom<EdgeInsetsGeometry>(
//     () => EdgeInsets.symmetric(vertical: value),
//     () => EdgeInsets.symmetric(vertical: value.h));

// /// {@category Utils}
// ///TODO DOC
// ///
// /// Permet de créer une SizedBox responsive en [width]
// Widget sw(double value) =>
//     SizedBox(width: execInCaseOfPlatfom<double>(() => value, () => value.w));

// /// {@category Utils}
// /// TODO DOC
// ///
// /// Permet de créer un padding horizontal et vertical responsive
// EdgeInsetsGeometry pwh(double height, double width) =>
//     execInCaseOfPlatfom<EdgeInsetsGeometry>(
//         () => EdgeInsets.symmetric(horizontal: width, vertical: height),
//         () => EdgeInsets.symmetric(horizontal: width.w, vertical: height.h));

// /// {@category Utils}
// ///
// /// Permet de récupérer une [fontSize] en responsive
// double sp(double value) =>
//     execInCaseOfPlatfom<double>(() => value, () => value.sp);

// /// {@category Utils}
// ///
// /// Permet de récupérer un [radius] en responsive
// double r(double value) =>
//     execInCaseOfPlatfom<double>(() => value, () => value.r);

// /// {@category Utils}
// ///
// /// Permet de récupérer une [height] en responsive
// double formatHeight(double value) =>
//     execInCaseOfPlatfom<double>(() => value, () => value.h);

// /// {@category Utils}
// ///
// /// Permet de récupérer une [width] en responsive
// double formatWidth(double value) =>
//     execInCaseOfPlatfom<double>(() => value, () => value.w);

// /// {@category Utils}
// ///
// class ResponsiveBuilder extends StatelessWidget {
//   final Widget child;
//   final Widget? phoneChild;
//   final Widget? tabletChild;

//   const ResponsiveBuilder({
//     Key? key,
//     required this.child,
//     this.phoneChild,
//     this.tabletChild,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final value =
//         getResponsiveValue(context, defaultValue: 1, phone: 2, tablet: 3);

//     return {
//       1: child,
//       2: phoneChild ?? child,
//       3: tabletChild ?? phoneChild ?? child
//     }[value]!;
//   }
// }
