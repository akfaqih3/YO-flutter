import 'package:yemen_offers/core/constants/api_constants.dart';
import 'package:yemen_offers/core/network/api_service.dart';
import 'package:yemen_offers/features/notification/data/models/notification_model.dart';

abstract class NotificationRemoteDataSource {
  Future<List<NotificationModel>> getListNotifications();
  Future<NotificationModel> openNotification(int id);
}

class NotificationRemoteDataSourceImpl implements NotificationRemoteDataSource {
  final ApiService _apiService;

  NotificationRemoteDataSourceImpl(this._apiService);

  @override
  Future<List<NotificationModel>> getListNotifications() async {
    final response = await _apiService.get(Endpoint.notifications);
    return NotificationModelsFromJson(response.data[ApiKeys.result]);
  }

  @override
  Future<NotificationModel> openNotification(int id) async {
    final response = await _apiService.get(Endpoint.notificationsOpen(id));
    return NotificationModel.fromJson(response.data);
  }
}
