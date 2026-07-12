import 'package:get/get_utils/src/extensions/export.dart';
import 'package:yemen_offers/core/services/localizition/app_langs/keys.dart';

String formatReadableDate(String? isoDateString, {String locale = 'ar'}) {
  try {
    if (isoDateString == null) return 'تاريخ غير متاح';
    final dateTime = DateTime.parse(isoDateString).toLocal();

    final arabicMonths = [
      'يناير',
      'فبراير',
      'مارس',
      'أبريل',
      'مايو',
      'يونيو',
      'يوليو',
      'أغسطس',
      'سبتمبر',
      'أكتوبر',
      'نوفمبر',
      'ديسمبر',
    ];

    final englishMonths = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December',
    ];

    final months = locale == 'ar' ? arabicMonths : englishMonths;

    final day = dateTime.day;
    final monthName = months[dateTime.month - 1];
    final year = dateTime.year;

    return ' $day $monthName $year';
  } catch (e) {
    return locale == 'ar' ? 'تاريخ غير متاح' : 'Date not available';
  }
}
