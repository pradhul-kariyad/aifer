// ignore_for_file: unused_import
import 'package:aifer/views/pages/home/homePage.dart';
import 'package:aifer/views/provider/connectivityProvider/connectivityProvider.dart';
import 'package:aifer/views/provider/loadingProvider/loadingProvider.dart';
import 'package:aifer/views/provider/photoProvider/photoProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) {
          return PhotoProvider();
        }),
        ChangeNotifierProvider(create: (context) {
          return ConnectivityProvider();
        }),
        ChangeNotifierProvider(create: (context) {
          return LoadingProvider();
        }),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (BuildContext context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Machine-Test',
            theme: ThemeData(
              primarySwatch: Colors.blue,
              textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
            ),
            home: child,
          );
        },
        child: const HomePage(),
      ),
    );
  }
}
