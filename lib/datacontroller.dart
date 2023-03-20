import 'package:get/get.dart';

import 'data_network.dart';
import 'datamodel.dart';

class DataController extends GetxController {
  @override
  void onInit() {
    fetchAllpostData();
    super.onInit();
  }

  var isLoading = false.obs;

  var allmytips = <UserDataModel>[].obs;

  void fetchAllpostData() async {
    try {
      isLoading(true);
      var allfinalpost = await DataApi.fetPostData();
      if (allfinalpost != null) {
        allmytips.assignAll(allfinalpost);
      }
    } finally {
      isLoading(false);
    }
  }
}
