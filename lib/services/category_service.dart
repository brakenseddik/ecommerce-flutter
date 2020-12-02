import 'package:ecommerce_api/repositories/repository.dart';

class SliderService {
  Repository _repository;
  SliderService() {
    _repository = Repository();
  }

  getCategories() async {
    return await _repository.getUrl('all-categories');
  }
}
