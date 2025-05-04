import 'package:flutter/material.dart';
import 'package:jupithair/common/constants.dart';

class LiveStoryList extends StatefulWidget {
  const LiveStoryList({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LiveStoryListState createState() => _LiveStoryListState();
}

class _LiveStoryListState extends State<LiveStoryList> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      controller: _scrollController, // Attach the ScrollController
      children: [
        SizedBox(
          width: 100 * 17,
          child: GridView.builder(
            scrollDirection: Axis.horizontal, // Enable horizontal scrolling
            controller: _scrollController, // Attach the ScrollController
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1, // Number of rows
              crossAxisSpacing: 5, // Space between columns
              mainAxisSpacing: 5, // Space between rows
              childAspectRatio: 1, // Adjust to maintain square items
            ),
            itemCount: 17, // Total number of items in the grid
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 2),
                    borderRadius: BorderRadius.circular(DEFAULT_RADIUS)),
                child: Center(
                  child: Text(
                    'Item $index',
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
