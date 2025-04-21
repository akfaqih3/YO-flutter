import 'package:dartz/dartz.dart';
import 'package:yemen_offers/core/errors/failures.dart';
import 'package:yemen_offers/features/notification/data/repos/notification_repo_impl.dart';
import 'package:yemen_offers/features/notification/domain/entities/notification_entity.dart';

class OpenNotificationUseCase {
  final NotificationRepoImpl _notificationRepo;
  OpenNotificationUseCase(this._notificationRepo);

  Future<Either<Failure, NotificationEntity>> execute(int id) async {
    return await _notificationRepo.openNotification(id);
  }
}