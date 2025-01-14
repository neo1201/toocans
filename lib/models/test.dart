import 'package:json_annotation/json_annotation.dart';

part 'test.g.dart';

@JsonSerializable()
class Test {
  Test();

  late String name;
  late List<String> keywords;
  num? age;
  late num weight;
  
  factory Test.fromJson(Map<String,dynamic> json) => _$TestFromJson(json);
  Map<String, dynamic> toJson() => _$TestToJson(this);
}
