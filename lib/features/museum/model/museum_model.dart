
import 'package:json_annotation/json_annotation.dart';
import '../../../core/base/model/base_model.dart';

part 'museum_model.g.dart';

@JsonSerializable()


class MuseumModel extends BaseModel<MuseumModel>{
    MuseumModel({
        this.muzeAd,
        this.muzeAciklama,
        this.calismaSaatleri,
        this.girisDetay,
        this.latitude,
        this.longitude,
        this.muzeAdres,
        this.muzeMail,
        this.muzeTel,
        this.muzeWebSite,
        this.sehir,
        this.ilce,
    });

    String? muzeAd;
    String? muzeAciklama;
    String? calismaSaatleri;
    String? girisDetay;
    double? latitude;
    double? longitude;
    String? muzeAdres;
    String? muzeMail;
    String? muzeTel;
    String? muzeWebSite;
    String? sehir;
    String? ilce;

    factory MuseumModel.fromJson(Map<String, dynamic> json) => _$MuseumModelFromJson(json);

  @override
  MuseumModel fromJson(Map<String, dynamic> json) {
    return _$MuseumModelFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$MuseumModelToJson(this);
  }
}



