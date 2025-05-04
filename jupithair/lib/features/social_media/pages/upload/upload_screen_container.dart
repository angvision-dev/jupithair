import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jupithair/common/default_height_gap.dart';
import 'package:jupithair/features/social_media/pages/upload/video_photo/video_photo_option_button.dart';
import 'package:jupithair/features/social_media/pages/upload/video_photo/publication/publication_container.dart';
import 'package:jupithair/features/social_media/models/provider.dart';

// ignore: must_be_immutable
class UploadScreenContainer extends ConsumerWidget {
  const UploadScreenContainer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final image = ref.watch(riverpodPublicationImage).image;

    Future pickImage(ImageSource source) async {
      try {
        final pickedImage = await ImagePicker().pickImage(source: source);
        if (pickedImage == null) return;

        ref.read(riverpodPublicationImage).setImage(File(pickedImage.path));
      } on PlatformException catch (e) {
        // ignore: avoid_print
        print(e);
        // ignore: use_build_context_synchronously
        // Navigator.of(context).pop();
      }
    }

    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          image == null
              ? Column(children: [
                  const _NoImageSelectedPage(),
                  const DefaultHeightGap(),
                  VideoPhotoOptionButton(onTap: pickImage)
                ])
              : PublicationContainer(image: image)
        ]);
  }
}

class _NoImageSelectedPage extends StatelessWidget {
  const _NoImageSelectedPage();

  @override
  Widget build(BuildContext context) {
    return const Text('No image selected',
        style: TextStyle(color: Colors.white));
  }
}
