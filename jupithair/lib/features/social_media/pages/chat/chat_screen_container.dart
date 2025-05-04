import 'package:flutter/material.dart';
import 'package:jupithair/common/constants.dart';
import 'package:jupithair/common/custom_search_bar.dart';
import 'package:jupithair/common/default_height_gap.dart';
import 'package:jupithair/features/social_media/pages/chat/room/chat_room_list.dart';

class ChatScreenContainer extends StatelessWidget {
  const ChatScreenContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: BACKGROUND_COLOR,
        child: const Column(children: <Widget>[
          DefaultHeightGap(),
          CustomSearchBar(),
          DefaultHeightGap(),
          Expanded(child: ChatRoomList())
        ]));
  }
}
