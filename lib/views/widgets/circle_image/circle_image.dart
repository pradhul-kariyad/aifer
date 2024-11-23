// ignore_for_file: file_names
import 'package:aifer/views/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AiferLogo extends StatelessWidget {
  const AiferLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 150.w),
      child: InkWell(
        onTap: () {},
        child: CircleAvatar(
          radius: 19.sp,
          backgroundColor: white,
          child: CircleAvatar(
            backgroundImage: AssetImage('assets/images/aifer_logo.png'),
            radius: 18.sp,
          ),
        ),
      ),
    );
  }
}
