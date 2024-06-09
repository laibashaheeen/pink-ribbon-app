import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pink_ribbon/data/app_colors.dart';
import 'package:pink_ribbon/views/widgets/custom_appbar.dart';
import 'package:video_player/video_player.dart';

class VideoPage extends StatefulWidget {
  const VideoPage({super.key});

  @override
  _VideoPageState createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  late List<FlickManager> flickManagers;

  final List<String> videoUrls = [
    'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
    'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
    'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
    'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
    // Add more URLs here
  ];

  @override
  void initState() {
    super.initState();
    flickManagers = videoUrls.map((url) {
      return FlickManager(
        videoPlayerController: VideoPlayerController.network(url),
      );
    }).toList();
  }

  @override
  void dispose() {
    for (var flickManager in flickManagers) {
      flickManager.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Videos', main: true,),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 24.w,),
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                AppColors.kBackgroundPink1.withOpacity(0.4),
                AppColors.kBackgroundPink2.withOpacity(0.5),
                AppColors.kWhite,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            children: [
              SizedBox(height: 50.h,),
              ListView.separated(
                separatorBuilder: (context, index) => SizedBox(height: 30.h),
                padding: EdgeInsets.zero,
                itemCount: flickManagers.length,
                shrinkWrap: true,
                
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.r)
                      ),
                    child: AspectRatio(
                      aspectRatio: 16 / 10,
                      child: FlickVideoPlayer(flickManager: flickManagers[index]),
                    ),
                  );
                },
              ),
              SizedBox(height: 80.h,),
            ],
          ),
        ),
      ),
    );
  }
}
