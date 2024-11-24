import 'package:ramses_web/features/app/domain/entities/info_entity.dart';

class InfoModel extends InfoEntity {
  InfoModel(
      {required super.title,
      required super.description,
      required super.imagen});

  factory InfoModel.fromJson(Map<String, dynamic> json) {
    return InfoModel(
      title: json['title'],
      description: json['description'],
      imagen: json['imagen'],
    );
  }
}
