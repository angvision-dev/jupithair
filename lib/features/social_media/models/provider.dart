import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jupithair/features/social_media/models/publication/model.dart';

final riverpodPublicationImage = ChangeNotifierProvider<ImageModel>((ref) {
  return ImageModel(image: null);
});

final riverpodForm = ChangeNotifierProvider<FormTextModel>((ref) {
  return FormTextModel(
    title: '',
    content: '',
    region: '',
    category: '',
  );
});
