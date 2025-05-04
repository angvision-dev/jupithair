import 'package:flutter/material.dart';
import 'package:jupithair/common/constants.dart';

class PublicationSubmit extends StatelessWidget {
  const PublicationSubmit({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Column(children: [
          SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    backgroundColor: CTA_BUTTON_COLOR),
                child: const Text(
                  'Publier',
                  style: TextStyle(color: Colors.white),
                ),
              ))
        ]));
  }
}
