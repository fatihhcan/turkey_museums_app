import 'package:json_annotation/json_annotation.dart';
import '../../../core/base/model/base_model.dart';
import 'county_model.dart';

part 'city_model.g.dart';

@JsonSerializable()
class CityModel extends BaseModel<CityModel>{
  CityModel({
    this.ilAdi,
    this.plakaKodu,
    this.ilceler,
  });

  String? ilAdi;
  String? plakaKodu;
  List<CountyModel>? ilceler;

  factory CityModel.fromJson(Map<String, dynamic> json) => _$CityModelFromJson(json);

  @override
  CityModel fromJson(Map<String, dynamic> json) {
    return _$CityModelFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$CityModelToJson(this);
  }
}

