import 'package:json_annotation/json_annotation.dart';

// Запускай flutter pub run build_runner watch, чтобы создать .g файл
part 'group.g.dart';

@JsonSerializable()
class Group {
	final String name;
	final String institute;

  Group({required this.name, required this.institute});

	Map<String, dynamic> toJson() => _$GroupToJson(this);
	factory Group.fromJson(Map<String, dynamic> json) => _$GroupFromJson(json);

}
