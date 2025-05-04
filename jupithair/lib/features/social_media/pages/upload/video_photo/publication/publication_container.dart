import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

import 'package:jupithair/features/social_media/pages/upload/video_photo/publication/publication_form.dart';
import 'package:jupithair/features/social_media/pages/upload/video_photo/publication/publication_header.dart';
import 'package:jupithair/features/social_media/pages/upload/video_photo/publication/publication_submit.dart';

class PublicationContainer extends StatefulWidget {
  final File image;

  const PublicationContainer({super.key, required this.image});

  @override
  _PublicationContainerState createState() => _PublicationContainerState();
}

class _PublicationContainerState extends State<PublicationContainer> {
  late StreamSubscription<bool> subscription;
  bool _isKeyboardVisible = false;

  @override
  void initState() {
    super.initState();

    // Listen for keyboard visibility changes
    subscription =
        KeyboardVisibilityController().onChange.listen((bool visible) {
      setState(() {
        _isKeyboardVisible = visible;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    subscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const PublicationHeader(),
          Container(
            margin: const EdgeInsets.all(10),
            child: SizedBox(
                height: _isKeyboardVisible ? 0 : screenHeight / 3,
                child: Image.file(widget.image)),
          ),
          Column(children: [
            PublicationForm(isKeyboardVisible: _isKeyboardVisible),
            if (!_isKeyboardVisible) const PublicationSubmit()
          ])
        ],
      ),
    );
  }
}
