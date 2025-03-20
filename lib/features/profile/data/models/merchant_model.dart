import 'package:yemen_offers/features/profile/domain/entities/merchant_entity.dart';

class MerchantModel extends MerchantEntity {
  final MerchantInfoModel merchantInfo;
  MerchantModel({
    int? id,
    required String email,
    required String name,
    required String gender,
    required double longitude,
    required double latitude,
    required String userType,
    required this.merchantInfo,
  }) : super(
         email: email,
         name: name,
         gender: gender,
         longitude: longitude,
         latitude: latitude,
         userType: userType,
         phone: merchantInfo.phone,
         idCommercial: merchantInfo.idCommercial,
         address: merchantInfo.address,
       );

  factory MerchantModel.fromJson(Map<String, dynamic> json) {
    return MerchantModel(
      id: json['id'],
      email: json['email'],
      name: json['name'],
      gender: json['gender'],
      longitude: json['longitude'],
      latitude: json['latitude'],
      userType: json['user_type'],
      merchantInfo: MerchantInfoModel.fromJson(json['merchant_info']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "email": email,
      "name": name,
      "gender": gender,
      "longitude": longitude,
      "latitude": latitude,
      "merchant_info": merchantInfo.toJson(),
    };
  }
}

class MerchantInfoModel {
  final String phone;
  final String idCommercial;
  final String address;

  MerchantInfoModel(this.phone, this.idCommercial, this.address);

  factory MerchantInfoModel.fromJson(Map<String, dynamic> json) {
    return MerchantInfoModel(
      json['phone'],
      json['id_commercial'],
      json['address'],
    );
  }

  Map<String, dynamic> toJson() {
    return {"phone": phone, "id_commercial": idCommercial, "address": address};
  }
}
