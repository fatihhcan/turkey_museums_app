// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CityModel _$CityModelFromJson(Map<String, dynamic> json) => CityModel(
      ilAdi: json['il_adi'] as String?,
      plakaKodu: json['plaka_kodu'] as String?,
      ilceler: (json['ilceler'] as List<dynamic>?)
          ?.map((e) => CountyModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CityModelToJson(CityModel instance) => <String, dynamic>{
      'il_adi': instance.ilAdi,
      'plakaKodu': instance.plakaKodu,
      'ilceler': instance.ilceler,
    };
