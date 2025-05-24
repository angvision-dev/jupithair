import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jupithair/common/default_height_gap.dart';
import 'package:jupithair/features/social_media/models/provider.dart';

class PublicationForm extends StatefulWidget {
  final bool isKeyboardVisible;
  const PublicationForm({super.key, required this.isKeyboardVisible});

  @override
  // ignore: library_private_types_in_public_api
  _PublicationFormState createState() => _PublicationFormState();
}

class _PublicationFormState extends State<PublicationForm> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: widget.isKeyboardVisible
          ? MainAxisAlignment
              .end // Change alignment based on keyboard visibility
          : MainAxisAlignment.start,
      children: [
        const _TitleInput(),
        const DefaultHeightGap(), // Always at the top

        Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              padding: const EdgeInsets.only(top: 10, right: 10, left: 10),
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Région, ville'),
                  Text("33 Gironde - Bordeaux"),
                ],
              ),
            ),
            SingleChildScrollView(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    _DynamicContentInput(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _TitleInput extends ConsumerWidget {
  const _TitleInput();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      margin: const EdgeInsets.only(left: 10, right: 10),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(50)),
      ),
      width: screenWidth / 2,
      child: Column(
        children: [
          TextFormField(
            textAlign: TextAlign.center,
            onChanged: (title) =>
                ref.read(riverpodForm.notifier).setTitle(title),
            decoration: const InputDecoration(
              hintText: 'Titre de la publication',
              border: InputBorder.none,
              hintStyle: TextStyle(color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}

class _DynamicContentInput extends ConsumerWidget {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      margin: const EdgeInsets.only(left: 10, right: 10),
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(8),
      ),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100), // Smooth resizing
        constraints: const BoxConstraints(
          minHeight: 50, // Minimum height
          maxHeight: 200, // Maximum height
        ),
        width: double.infinity,
        child: TextFormField(
          controller: _controller,
          onChanged: (content) =>
              ref.read(riverpodForm.notifier).setContent(content),
          textAlign: TextAlign.left,
          decoration: const InputDecoration(
            hintText: 'Content',
            border: InputBorder.none,
            hintStyle: TextStyle(color: Colors.grey),
          ),
          maxLines: null, // Unlimited lines, auto-wrap
          maxLength: 100,
          keyboardType: TextInputType.multiline,
          textInputAction: TextInputAction.newline,
        ),
      ),
    );
  }
}
