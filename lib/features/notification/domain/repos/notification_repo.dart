
import 'package:dartz/dartz.dart';
import 'package:yemen_offers/core/errors/failures.dart';
import 'package:yemen_offers/features/notification/domain/entities/notification_entity.dart';

abstract class NotificationRepo {
  Future<Either<Failure, List<NotificationEntity>>> getListNotifications();
  Future<Either<Failure, NotificationEntity>> openNotification(int id);
}