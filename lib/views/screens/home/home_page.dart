// ignore_for_file: use_build_context_synchronously, unrelated_type_equality_checks, file_names
import 'package:aifer/views/colors/colors.dart';
import 'package:aifer/views/provider/connectivity_provider/connectivity_provider.dart';
import 'package:aifer/views/provider/loading_provider/loading_provider.dart';
import 'package:aifer/views/provider/photo_provider/photo_provider.dart';
import 'package:aifer/views/widgets/follow_button/follow_button.dart';
import 'package:aifer/views/widgets/activity_row/activity_row.dart';
import 'package:aifer/views/widgets/circle_image/circle_image.dart';
import 'package:aifer/views/widgets/my_icon/my_icon.dart';
import 'package:aifer/views/widgets/new_navigationbar/new_navigationbar.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:fl_downloader/fl_downloader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    checkConnectivity();
    FlDownloader.initialize();
    FlDownloader.progressStream.listen((event) {
      if (event.status == DownloadStatus.successful) {
        FlDownloader.openFile(filePath: event.filePath);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: black,
        leading: MyIcon(),
        title: AiferLogo(),
        actions: [FollowButton()],
      ),
      body: Consumer<LoadingProvider>(
        builder: (context, loadingProvider, Widget? child) {
          if (loadingProvider.isLoading) {
            return Center(
              child: CircularProgressIndicator(
                color: black,
              ),
            );
          }
          return Consumer<ConnectivityProvider>(
            builder: (context, connectivityProvider, Widget? child) {
              return SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    ActivityRow(),
                    Stack(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 564.h,
                          decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20.sp),
                              topRight: Radius.circular(20.sp),
                            ),
                          ),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 10.h),
                                Center(
                                  child: Text(
                                    'All products',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      color: black,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 18.h),
                                Consumer<PhotoProvider>(
                                  builder:
                                      (context, photoProvider, Widget? child) {
                                    final thumbUrl = photoProvider.thumbUrl;
                                    final description =
                                        photoProvider.description;
                                    return MasonryGridView.count(
                                      crossAxisCount: 2,
                                      mainAxisSpacing: 10.w,
                                      crossAxisSpacing: 10.w,
                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                      itemCount: 8,
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10.w),
                                      itemBuilder: (context, index) {
                                        double containerHeight =
                                            (index % 2 == 0) ? 250.h : 190.h;
                                        return Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            GestureDetector(
                                              onTap: () async {
                                                final imageUrl =
                                                    photoProvider.fullUrl ?? '';
                                                final fileName =
                                                    'Aifer_Education$index.jpg';
                                                await downloadImage(
                                                    imageUrl, fileName);
                                              },
                                              child: Container(
                                                width: 165.w,
                                                height: containerHeight,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          18.sp),
                                                  image: DecorationImage(
                                                    image: NetworkImage(
                                                      thumbUrl ??
                                                          'https://via.placeholder.com/150',
                                                    ),
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                          top: 5.h, left: 7.w),
                                                      padding: EdgeInsets.only(
                                                          left: 8.w,
                                                          right: 8.w,
                                                          top: 3.h),
                                                      height: 20.h,
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      20.sp),
                                                          color: gwhite),
                                                      child: Text(
                                                        //  textAlign: TextAlign.center,
                                                        '\$60',
                                                        style: TextStyle(
                                                          fontFamily: 'Poppins',
                                                          color: black,
                                                          fontSize: 12.sp,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            SizedBox(height: 8.h),
                                            Text(
                                              description ?? 'Name',
                                              style: TextStyle(
                                                fontFamily: 'Poppins',
                                                color: black,
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                )
                              ],
                            ),
                          ),
                        ),
                        NewNavigationBar()
                      ],
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }

  checkConnectivity() async {
    final loadingProvider =
        Provider.of<LoadingProvider>(context, listen: false);
    WidgetsBinding.instance
        .addPostFrameCallback((_) => loadingProvider.isLoading = true);

    var connectivityResult = await Connectivity().checkConnectivity();
    final connectivityProvider =
        Provider.of<ConnectivityProvider>(context, listen: false);

    if (connectivityResult == ConnectivityResult.none) {
      connectivityProvider.isConnected = false;
    } else {
      connectivityProvider.isConnected = true;
      final json = {
        "id": "Dwu85P9SOIk",
        "description": "A man drinking a coffee.",
        "urls": {
          "thumb":
              "https://images.unsplash.com/photo-1417325384643-aac51acc9e5d?q=75&fm=jpg&w=200&fit=max",
          "full":
              "https://images.unsplash.com/photo-1417325384643-aac51acc9e5d?q=100&fm=jpg&w=1080&fit=max"
        },
      };

      if (connectivityProvider.isConnected) {
        Provider.of<PhotoProvider>(context, listen: false).loadPhoto(json);
      }
    }

    WidgetsBinding.instance
        .addPostFrameCallback((_) => loadingProvider.isLoading = false);
  }

  Future<void> requestPermission() async {
    final status = await Permission.storage.request();
    if (status.isDenied || status.isPermanentlyDenied) {
      openAppSettings();
    }
  }

  Future<void> downloadImage(String imageUrl, String fileName) async {
    // await requestPermission();
    FlDownloader.download(imageUrl, fileName: fileName);
  }
}
