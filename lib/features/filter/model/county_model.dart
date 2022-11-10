import 'package:json_annotation/json_annotation.dart';
import '../../../core/base/model/base_model.dart';

part 'county_model.g.dart';

@JsonSerializable()
class CountyModel extends BaseModel<CountyModel>{
  CountyModel({
    this.ilceAdi,
  });

  String? ilceAdi;

factory CountyModel.fromJson(Map<String, dynamic> json) => _$CountyModelFromJson(json);

  @override
  CountyModel fromJson(Map<String, dynamic> json) {
    return _$CountyModelFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$CountyModelToJson(this);
  }
}