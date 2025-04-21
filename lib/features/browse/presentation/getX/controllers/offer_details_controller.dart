import 'package:get/get.dart';
import 'package:yemen_offers/core/network/api_service.dart';
import 'package:yemen_offers/core/routes/app_routes.dart';
import 'package:yemen_offers/features/browse/data/repos/browse_repo_impl.dart';
import 'package:yemen_offers/features/browse/data/sources/browse_remote_data_source.dart';
import 'package:yemen_offers/features/browse/domain/entities/offer_entity.dart';
import 'package:yemen_offers/features/browse/domain/use_cases/get_offer_details_use_case.dart';
import 'package:yemen_offers/features/store/domain/entities/merchant_store_etity.dart';

class OfferDetailsController extends GetxController {
  final ApiService _apiService = Get.find<ApiService>();
  late BrowseRepoImpl _browseRepoImpl;

  Rx<OfferEntity?> offer = Rx<OfferEntity?>(null);

  @override
  void onInit() async {
    super.onInit();
    _browseRepoImpl = BrowseRepoImpl(BrowseRemoteDataSourceImpl(_apiService));
    offer(Get.arguments['offer']);
    getOfferDetails();
  }

  void getOfferDetails() async {
    final GetOfferDetailsUseCase getOfferDetailsUseCase =
        GetOfferDetailsUseCase(_browseRepoImpl);

    final result = await getOfferDetailsUseCase.execute(offer.value!.slug!);
    result.fold(
      (failure) => Get.snackbar("error", failure.message),
      (offerEntity) => offer(offerEntity),
    );
  }
}
