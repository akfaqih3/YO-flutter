import 'package:yemen_offers/core/cache/cache_helper.dart';
import 'package:yemen_offers/core/constants/cache_constants.dart';

abstract class OnboardingLocalDataSource {
  Future<void> setFalseFirstOpenApp();
}

class OnboardingLocalDataSourceImpl extends OnboardingLocalDataSource {
  @override
  Future<void> setFalseFirstOpenApp() async {
    await CacheHelper.saveData(CacheKeys.isFirstOpen, false);
  }
}
