import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jupithair/common/constants.dart';
import 'package:jupithair/features/social_media/models/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class PublicationSubmit extends ConsumerWidget {
  const PublicationSubmit({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final supabase = Supabase.instance.client;

    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => submitPublication(context, ref, supabase),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                backgroundColor: CTA_BUTTON_COLOR,
              ),
              child: const Text(
                'Publier',
                style: TextStyle(color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<void> submitPublication(
      BuildContext context, WidgetRef ref, SupabaseClient supabase) async {
    try {
      // Show loading indicator or set submitting state if needed

      // Get form data
      final formData = ref.read(riverpodForm);
      final imageFile = ref.read(riverpodPublicationImage).image;

      // Validate required fields
      if (formData.title == '' || formData.content == '') {
        throw Exception('Title and content are required');
      }

      // Insert publication
      await supabase.from('Publications').insert({
        'title': formData.title,
        'description': formData.content,
        'media_url': imageFile?.path,
        'created_at': DateTime.now().toIso8601String(),
        'date_publication': DateTime.now().toIso8601String(),
      });

      // Clear form on success
      ref.read(riverpodForm.notifier).removeForm();
      ref.read(riverpodPublicationImage.notifier).removeImage();

      // Show success message
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Publication successful!')),
        );
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: ${e.toString()}')),
        );
      }
    }
  }
}
