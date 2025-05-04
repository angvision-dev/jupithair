import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jupithair/common/constants.dart';

class VideoPhotoOptionButton extends StatelessWidget {
  final Function(ImageSource source) onTap;
  const VideoPhotoOptionButton({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style =
        ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        _ButtonVideo(style: style, onTap: onTap),
        const SizedBox(width: DEFAULT_WIDTH),
        _ButtonPhoto(style: style, onTap: onTap),
      ],
    );
  }
}

class _ButtonPhoto extends StatelessWidget {
  const _ButtonPhoto({
    required this.style,
    required this.onTap,
  });

  final ButtonStyle style;
  final Function(ImageSource source) onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: style,
      onPressed: () => onTap(ImageSource.gallery),
      child: const Wrap(
        children: <Widget>[
          Icon(
            Icons.photo,
            color: DEFAULT_COLOR,
            size: 24.0,
          ),
          SizedBox(
            width: 10,
          ),
          Text("Galerie", style: TextStyle(fontSize: 20, color: DEFAULT_COLOR)),
        ],
      ),
    );
  }
}

class _ButtonVideo extends StatelessWidget {
  const _ButtonVideo({
    required this.style,
    required this.onTap,
  });

  final ButtonStyle style;
  final Function(ImageSource source) onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: style,
      onPressed: () => onTap(ImageSource.camera),
      child: const Wrap(
        children: <Widget>[
          Icon(
            Icons.videocam,
            color: DEFAULT_COLOR,
            size: 24.0,
          ),
          SizedBox(
            width: 10,
          ),
          Text("Vidéo", style: TextStyle(fontSize: 20, color: DEFAULT_COLOR)),
        ],
      ),
    );
  }
}
