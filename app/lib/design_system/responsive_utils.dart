import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// SizedBox responsive in [width]
Widget sw(double value) => SizedBox(width: value.w);

// SizedBox responsive in [height]
Widget sh(double value) => SizedBox(height: value.h);

/// Padding horizontal responsive
EdgeInsetsGeometry pw(double value) =>
    EdgeInsets.symmetric(horizontal: value.w);

/// Padding vertical responsive
EdgeInsetsGeometry ph(double value) => EdgeInsets.symmetric(vertical: value.h);

/// Horizontal + Vertical padding responsive
EdgeInsetsGeometry pwh(double height, double width) =>
    EdgeInsets.symmetric(horizontal: width.w, vertical: height.h);

/// Responsive [fontSize]
double sp(double value) => value.sp;

/// Responsive [radius]
BorderRadius br(double value) => BorderRadius.circular(value.r);

/// Responsive [height]
double formatHeight(double value) => value.h;

/// Responsive [width]
double formatWidth(double value) => value.w;
