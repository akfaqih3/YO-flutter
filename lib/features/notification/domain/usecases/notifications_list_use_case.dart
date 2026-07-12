import 'package:dartz/dartz.dart';
import 'package:yemen_offers/core/errors/failures.dart';
import 'package:yemen_offers/features/notification/data/repos/notification_repo_impl.dart';
import 'package:yemen_offers/features/notification/domain/entities/notification_entity.dart';
import 'package:yemen_offers/features/notification/domain/repos/notification_repo.dart';

class NotificationsListUseCase {
  final NotificationRepoImpl _notificationRepo;
  NotificationsListUseCase(this._notificationRepo);

  Future<Either<Failure, List<NotificationEntity>>> execute() async {
    return await _notificationRepo.getListNotifications();
  }
}