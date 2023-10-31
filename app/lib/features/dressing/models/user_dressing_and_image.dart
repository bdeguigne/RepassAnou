import 'package:flutter/foundation.dart';
import 'package:repasse_anou/features/dressing/models/user_dressing.dart';

class UserDressingAndImage {
  final UserDressing userDressing;
  final Uint8List? image;

  UserDressingAndImage({
    required this.userDressing,
    this.image,
  });
}
