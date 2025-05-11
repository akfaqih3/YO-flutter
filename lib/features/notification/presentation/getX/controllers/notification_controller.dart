import 'package:get/get.dart';
import 'package:yemen_offers/core/constants/api_constants.dart';
import 'package:yemen_offers/core/network/api_service.dart';
import 'package:yemen_offers/core/routes/app_routes.dart';
import 'package:yemen_offers/features/notification/data/repos/notification_repo_impl.dart';
import 'package:yemen_offers/features/notification/data/sources/notification_remote_data_source.dart';
import 'package:yemen_offers/features/notification/domain/entities/notification_entity.dart';
import 'package:yemen_offers/features/notification/domain/usecases/notifications_list_use_case.dart';
import 'package:yemen_offers/features/notification/domain/usecases/open_notification_use_case.dart';

class NotificationController extends GetxController {
  final ApiService _apiService = Get.find<ApiService>();
  late NotificationRepoImpl _notificationRepoImpl;

  final RxList<NotificationEntity> notifications = RxList<NotificationEntity>(
    [],
  );
  final RxInt count = RxInt(0);

  @override
  void onInit() async {
    _notificationRepoImpl = NotificationRepoImpl(
      NotificationRemoteDataSourceImpl(_apiService),
    );
    super.onInit();
    await getNotifications();
  }

  Future<void> getNotifications() async {
    final NotificationsListUseCase notificationsListUseCase =
        NotificationsListUseCase(_notificationRepoImpl);
    final result = await notificationsListUseCase.execute();
    result.fold(
      (left) {
        Get.snackbar("خطاء", left.message.toString());
      },
      (right) {
        notifications.value = right;
        count.value = right.map((e) => e.isRead ? 0 : 1).reduce((a, b) => a + b);
      },
    );
  }

  Future<void> openNotification(int id) async {
    final OpenNotificationUseCase openNotificationUseCase =
        OpenNotificationUseCase(_notificationRepoImpl);
    final result = await openNotificationUseCase.execute(id);
    await getNotifications();
    result.fold(
      (left) {
        Get.snackbar("خطاء", left.message.toString());
      },
      (right) {
        Get.toNamed(
          AppRoutes.offerDetails,
          arguments: {ApiKeys.offerSlug: right.offer_slug},
        );
      },
    );
  }
}
