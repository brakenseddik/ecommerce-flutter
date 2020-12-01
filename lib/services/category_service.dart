import 'package:ecommerce_api/repositories/repository.dart';

class CategoryService {
  Repository _repository;
  CategoryService() {
    _repository = Repository();
  }

  getCategories() async {
    return await _repository.getUrl('get-categories');
  }
}
