import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppIcons {
  static Widget heart = SvgPicture.asset('assets/icons/heart.svg');
  static Widget heartFill = SvgPicture.asset('assets/icons/heart-fill.svg');
  static Widget arrowBack =
      const Icon(Icons.arrow_back_ios_new, color: Colors.black);
  static Widget checkWhite = SvgPicture.asset(
    'assets/icons/check.svg',
    colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
  );
  static Widget check = SvgPicture.asset('assets/icons/check.svg');
  static Widget dressingSelected = Image.asset(
    'assets/icons/dressing-selected.png',
  );
  static Widget dressingNotSelected =
      Image.asset('assets/icons/dressing-not-selected.png');
  static Widget circleGrey = const Icon(
    Icons.circle,
    color: Color(0xffDADADA),
  );
  static Widget circleBlack = const Icon(
    Icons.circle,
  );
  static Widget search = SvgPicture.asset('assets/icons/search.svg');
  static Image bag = Image.asset('assets/icons/bag.png');
}
