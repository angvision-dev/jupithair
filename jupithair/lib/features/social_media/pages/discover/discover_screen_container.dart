import 'package:flutter/material.dart';
import 'package:jupithair/common/constants.dart';
import 'package:jupithair/common/custom_search_bar.dart';
import 'package:jupithair/common/default_height_gap.dart';
import 'package:jupithair/features/social_media/pages/discover/filter/discover_filter.dart';
import 'package:jupithair/features/social_media/pages/discover/video_photo/video_photo_list.dart';

class DiscoverScreenContainer extends StatelessWidget {
  const DiscoverScreenContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: BACKGROUND_COLOR,
      child: const Column(children: <Widget>[
        DefaultHeightGap(),
        CustomSearchBar(),
        DefaultHeightGap(),
        Expanded(child: VideoPhotoList()),
        DefaultHeightGap(),
        DiscoverFilter(),
        DefaultHeightGap(),
      ]),
    );
  }
}
