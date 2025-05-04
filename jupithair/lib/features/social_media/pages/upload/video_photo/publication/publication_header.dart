import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jupithair/features/social_media/models/provider.dart';

class PublicationHeader extends StatelessWidget {
  const PublicationHeader({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      height: screenHeight / 15,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: const Stack(
        children: [
          _PublicationCancelButton(),
          _PublicationProfessionalTitle(
              title: 'Professional Title', subtitle: 'Pro Subtitle'),
        ],
      ),
    );
  }
}

class _PublicationCancelButton extends ConsumerWidget {
  const _PublicationCancelButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Positioned(
        left: 0,
        top: 0,
        bottom: 0,
        child: Container(
            margin: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black, // Set the border color
                width: 1.5, // Set the border width
              ),
              borderRadius: BorderRadius.circular(8),
              // Optional: Make the border rounded
            ),
            child: IconButton(
              icon: const Icon(Icons.arrow_back),
              iconSize: 25,
              onPressed: () {
                ref.read(riverpodPublicationImage).removeImage();
              },
            )));
  }
}

class _PublicationProfessionalTitle extends StatelessWidget {
  final String title;
  final String subtitle;

  const _PublicationProfessionalTitle({
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text(title), Text(subtitle)]));
  }
}
