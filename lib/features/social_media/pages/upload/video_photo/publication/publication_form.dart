import 'package:flutter/material.dart';
import 'package:jupithair/common/default_height_gap.dart';

class PublicationForm extends StatefulWidget {
  final bool isKeyboardVisible;
  const PublicationForm({super.key, required this.isKeyboardVisible});

  @override
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

class _TitleInput extends StatelessWidget {
  const _TitleInput();

  @override
  Widget build(BuildContext context) {
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

class _DynamicContentInput extends StatefulWidget {
  @override
  _DynamicContentInputState createState() => _DynamicContentInputState();
}

class _DynamicContentInputState extends State<_DynamicContentInput> {
  final TextEditingController _controller = TextEditingController();
  double _boxHeight = 30; // Initial height

  @override
  void initState() {
    super.initState();
    _controller.addListener(_adjustHeight);
  }

  @override
  void dispose() {
    _controller.removeListener(_adjustHeight);
    _controller.dispose();
    super.dispose();
  }

  void _adjustHeight() {
    final textSpan = TextSpan(
      text: _controller.text,
      style: const TextStyle(fontSize: 16.0), // Match TextFormField font
    );
    final textPainter = TextPainter(
      text: textSpan,
      maxLines: null,
      textDirection: TextDirection.ltr,
    );
    textPainter.layout(
        maxWidth: MediaQuery.of(context).size.width - 32); // Adjust width

    setState(() {
      _boxHeight = textPainter.height + 10; // Adjust height dynamically
      _boxHeight = _boxHeight.clamp(50.0, 180.0); // Min 50px, Max 200px
    });
  }

  @override
  Widget build(BuildContext context) {
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
          textAlign: TextAlign.left,
          decoration: const InputDecoration(
            hintText: 'Content',
            border: InputBorder.none,
            hintStyle: TextStyle(color: Colors.grey),
          ),
          maxLines: null, // Unlimited lines, auto-wrap
          maxLength: 200,
          keyboardType: TextInputType.multiline,
          textInputAction: TextInputAction.newline,
        ),
      ),
    );
  }
}
