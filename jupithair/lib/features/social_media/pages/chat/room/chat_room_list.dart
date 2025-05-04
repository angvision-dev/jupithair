import 'package:flutter/material.dart';
import 'package:jupithair/common/constants.dart';

class ChatRoomList extends StatefulWidget {
  const ChatRoomList({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ChatRoomListState createState() => _ChatRoomListState();
}

class _ChatRoomListState extends State<ChatRoomList> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 20,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: DEFAULT_PADDING),
          child: Container(
            height: 50,
            color: Colors.white,
            child: const Row(
              children: [
                CircleAvatar(
                  radius: DEFAULT_WIDTH * 3,
                ),
                SizedBox(
                  width: DEFAULT_WIDTH,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              'User Name',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '12:00',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                              ),
                            ),
                          ]),
                      Text(
                        'Last message',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
