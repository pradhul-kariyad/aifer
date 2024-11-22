// ignore_for_file: file_names
import 'package:aifer/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FollowButton extends StatelessWidget {
  const FollowButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.only(right: 6.w),
        width: 75.w,
        height: 33.h,
        decoration: BoxDecoration(
          color: red,
          borderRadius: BorderRadius.circular(20.sp),
        ),
        child: Center(
            child: Text(
          'Follow',
          style: TextStyle(
              fontFamily: 'Poppins',
              color: white,
              fontSize: 12.sp,
              fontWeight: FontWeight.bold),
        )),
      ),
    );
  }
}
