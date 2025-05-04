import 'package:flutter/material.dart';
import 'package:jupithair/common/constants.dart';
import 'package:jupithair/features/social_media/pages/upload/upload_screen_container.dart';
import 'package:jupithair/features/social_media/pages/chat/chat_screen_container.dart';
import 'package:jupithair/features/social_media/pages/discover/discover_screen_container.dart';
import 'package:jupithair/features/social_media/pages/home/home_screen_container.dart';

class SocialMediaContainer extends StatelessWidget {
  final int currentIndex;

  const SocialMediaContainer({super.key, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    Widget page;
    switch (currentIndex) {
      case 0:
        page = const HomeScreenContainer();
        break;
      case 1:
        page = const DiscoverScreenContainer();
        break;
      case 2:
        page = const ChatScreenContainer();
        break;
      case 3:
        page = const UploadScreenContainer();
        break;
      default:
        throw UnimplementedError("Unknown index: $currentIndex");
    }
    // Define the margin based on the index
    final margin = currentIndex != 3
        ? const EdgeInsets.symmetric(horizontal: 10)
        : EdgeInsets.zero;
    return Container(
      color: BACKGROUND_COLOR,
      child: Center(
        child: Container(
          margin: margin, // Apply the calculated margin
          child: page,
        ),
      ),
    );
  }
}
