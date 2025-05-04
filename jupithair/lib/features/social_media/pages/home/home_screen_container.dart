import 'package:flutter/material.dart';
import 'package:jupithair/common/constants.dart';
import 'package:jupithair/common/default_height_gap.dart';
import 'package:jupithair/features/social_media/pages/home/description/description.dart';
import 'package:jupithair/features/social_media/pages/home/live_story/live_story_list.dart';

class HomeScreenContainer extends StatelessWidget {
  const HomeScreenContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: BACKGROUND_COLOR,
      child: Column(
        children: <Widget>[
          const DefaultHeightGap(),
          Expanded(
              flex: 7,
              child: Container(
                  decoration: BoxDecoration(border: Border.all()),
                  width: double.infinity,
                  child: const Placeholder(
                    strokeWidth: 1,
                  ))),
          const DefaultHeightGap(),
          const Expanded(flex: 1, child: Description()),
          const DefaultHeightGap(),
          const Expanded(
            flex: 1,
            child: LiveStoryList(),
          ),
          const DefaultHeightGap(),
        ],
      ),
    );
  }
}
