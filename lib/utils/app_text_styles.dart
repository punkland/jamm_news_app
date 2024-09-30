import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class AppTextStyles {
  static TextStyle detailTitle =
      TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w400);

  static TextStyle appTitle = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 20.sp,
  );
  static TextStyle detailDescription = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 18.sp,
  );
  static TextStyle detailContent = TextStyle(
    fontWeight: FontWeight.w300,
    fontSize: 20.sp,
  );
  static TextStyle detailDate = TextStyle(
    fontWeight: FontWeight.w300,
    fontSize: 14.sp,
  );

  static TextStyle summaryTitle = TextStyle(
      overflow: TextOverflow.ellipsis,
      fontSize: 18.sp,
      fontWeight: FontWeight.w400);

  static TextStyle summaryDescription = TextStyle(
      overflow: TextOverflow.ellipsis,
      fontSize: 16.sp,
      fontWeight: FontWeight.w300);

  static TextStyle category = TextStyle(
      overflow: TextOverflow.ellipsis,
      fontSize: 16.sp,
      color: Colors.white,
      fontWeight: FontWeight.w300);
}
