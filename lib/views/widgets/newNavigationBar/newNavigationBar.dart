// ignore_for_file: file_names
import 'package:aifer/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewNavigationBar extends StatelessWidget {
  const NewNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 25.h,
      left: 72.w,
      child: Center(
        child: Container(
          width: 220.w,
          height: 40.h,
          decoration: BoxDecoration(
            color: white,
            borderRadius: BorderRadius.circular(22.sp),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                offset: Offset(2, 1),
                blurRadius: 1,
                spreadRadius: 1,
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {},
                  child: CircleAvatar(
                    radius: 13.sp,
                    backgroundImage: AssetImage('assets/images/aifer.png'),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.search,
                    color: grey,
                    size: 26.sp,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.notifications,
                    color: grey,
                    size: 23.sp,
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: CircleAvatar(
                    radius: 13.sp,
                    backgroundImage: AssetImage('assets/images/aifer_logo.png'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
