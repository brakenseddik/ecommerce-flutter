import 'package:ecommerce_api/repositories/repository.dart';

class SliderService {
  Repository _repository;
  SliderService() {
    _repository = Repository();
  }

  getSliders() async {
    return await _repository.getUrl('all-sliders');
  }
}
