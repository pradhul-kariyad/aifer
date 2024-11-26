// ignore_for_file: unused_import
import 'package:aifer/views/provider/fetch_image_provider/fetch_image_provider.dart';
import 'package:aifer/views/screens/home/home_page.dart';
import 'package:aifer/views/provider/connectivity_provider/connectivity_provider.dart';
import 'package:aifer/views/provider/loading_provider/loading_provider.dart';
import 'package:aifer/views/provider/photo_provider/photo_provider.dart';
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
        ChangeNotifierProvider(create: (context) {
          return FetchImageProvider();
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
