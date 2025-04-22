import 'package:craftybay/app/app_urls.dart';
import 'package:craftybay/core/network_caller/network_caller.dart';
import 'package:craftybay/features/home/data/models/slider_model.dart';
import 'package:get/get.dart';

class HomeSliderController extends GetxController {
  bool _Inprogress = false;

  bool get inProgress => _Inprogress;

  List<SliderModel> _sliderList = [];

  List<SliderModel> get sliders => _sliderList;

  String? _errorMessage;

  String? get errorMessage => _errorMessage;

  Future<bool> getSliders() async {
    bool isSuccess = false;
    _Inprogress = true;
    update();

    final NetworkResponse response =
        await Get.find<NetworkCaller>().getRequest(url: AppUrls.slidersUrl);

    if (response.isSuccess) {
      List<SliderModel> list = [];

      for (Map<String, dynamic> data
          in response.responseData?['data']['results'] ?? []) {
        list.add(SliderModel.fromJson(data));
      }
      _sliderList = list;
      isSuccess = true;
      _errorMessage = null;
    } else {
      _errorMessage = response.errorMessage;
    }

    _Inprogress = false;
    update();

    return isSuccess;
  }
}
