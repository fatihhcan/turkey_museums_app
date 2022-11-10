// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'museum_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MuseumModel _$MuseumModelFromJson(Map<String, dynamic> json) => MuseumModel(
      muzeAd: json['muzeAd'] as String?,
      muzeAciklama: json['muzeAciklama'] as String?,
      calismaSaatleri: json['calismaSaatleri'] as String?,
      girisDetay: json['girisDetay'] as String?,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      muzeAdres: json['muzeAdres'] as String?,
      muzeMail: json['muzeMail'] as String?,
      muzeTel: json['muzeTel'] as String?,
      muzeWebSite: json['muzeWebSite'] as String?,
      sehir: json['sehir'] as String?,
      ilce: json['ilce'] as String?,
    );

Map<String, dynamic> _$MuseumModelToJson(MuseumModel instance) =>
    <String, dynamic>{
      'muzeAd': instance.muzeAd,
      'muzeAciklama': instance.muzeAciklama,
      'calismaSaatleri': instance.calismaSaatleri,
      'girisDetay': instance.girisDetay,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'muzeAdres': instance.muzeAdres,
      'muzeMail': instance.muzeMail,
      'muzeTel': instance.muzeTel,
      'muzeWebSite': instance.muzeWebSite,
      'sehir': instance.sehir,
      'ilce': instance.ilce,
    };
