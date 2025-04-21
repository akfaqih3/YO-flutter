import 'package:dartz/dartz.dart';
import 'package:yemen_offers/core/errors/exceptions.dart';
import 'package:yemen_offers/core/errors/failures.dart';
import 'package:yemen_offers/features/notification/data/sources/notification_remote_data_source.dart';
import 'package:yemen_offers/features/notification/domain/entities/notification_entity.dart';

import '../../domain/repos/notification_repo.dart';

class NotificationRepoImpl implements NotificationRepo {
  final NotificationRemoteDataSource remoteDataSource;

  NotificationRepoImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, List<NotificationEntity>>> getListNotifications() async {
    try {
      final notifications = await remoteDataSource.getListNotifications();
      return right(notificationEntitiesFromModels(notifications));
    } catch (e) {
      return left(Exceptions.handleCatch(e));
    }
  }

  @override
  Future<Either<Failure, NotificationEntity>> openNotification(int id) async {
    try {
      final notification = await remoteDataSource.openNotification(id);
      return right(NotificationEntity.fromModel(notification));
    } catch (e) {
      return left(Exceptions.handleCatch(e));
    }
  }
}