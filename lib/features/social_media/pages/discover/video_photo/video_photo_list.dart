import 'package:flutter/material.dart';
import 'package:jupithair/common/constants.dart';

class VideoPhotoList extends StatelessWidget {
  const VideoPhotoList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: GridView.count(
        crossAxisCount: 3,
        crossAxisSpacing: DEFAULT_RADIUS / 3,
        mainAxisSpacing: DEFAULT_RADIUS / 3,
        childAspectRatio: (2 / 3),
        children: [
          ...List.generate(
            30,
            (index) => Container(
              decoration: BoxDecoration(
                border: Border.all(color: BACKGROUND_COLOR, width: 2),
                borderRadius: BorderRadius.circular(DEFAULT_RADIUS),
              ),
              child: Center(
                child: Text(
                  'Item $index',
                  style: const TextStyle(color: Colors.black),
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
