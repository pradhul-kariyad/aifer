// ignore_for_file: file_names
import 'package:aifer/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ActivityRow extends StatelessWidget {
  const ActivityRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 65.w, right: 65.w, bottom: 13.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            'Activity',
            style: TextStyle(
                fontFamily: 'Poppins',
                color: white,
                fontSize: 12.sp,
                fontWeight: FontWeight.bold),
          ),
          Text(
            'Community',
            style: TextStyle(
                fontFamily: 'Poppins',
                color: white,
                fontSize: 12.sp,
                fontWeight: FontWeight.bold),
          ),
          Container(
            width: 58.w,
            height: 35.h,
            decoration: BoxDecoration(
              color: white,
              borderRadius: BorderRadius.circular(20.sp),
            ),
            child: Center(
              child: Text(
                'Shop',
                style: TextStyle(
                    fontFamily: 'Poppins',
                    color: black,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
