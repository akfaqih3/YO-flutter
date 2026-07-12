import 'package:yemen_offers/features/profile/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  String? longitude;
  String? latitude;
  UserModel({
    int? id,
    required String email,
    required String name,
    required String gender,
    this.longitude,
    this.latitude,
    required String userType,
  }) : super(email: email, name: name, gender: gender, userType: userType);

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      email: json['email'],
      name: json['name'],
      gender: json['gender'],
      longitude: json['longitude'],
      latitude: json['latitude'],
      userType: json['user_type'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "email": email,
      "name": name,
      "gender": gender,
      "longitude": longitude,
      "latitude": latitude,
    };
  }
}
