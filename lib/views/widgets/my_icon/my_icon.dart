// ignore_for_file: file_names, avoid_print
import 'package:aifer/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyIcon extends StatelessWidget {
  const MyIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
          onPressed: () {
            print('Back button');
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: white,
            size: 20.sp,
          ),
        );
  }
}