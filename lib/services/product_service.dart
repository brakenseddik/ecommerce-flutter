import 'package:ecommerce_api/repositories/repository.dart';

class ProductService {
  Repository _repository;
  ProductService() {
    _repository = Repository();
  }

  getHotProducts() async {
    return await _repository.getUrl('all-hot-products');
  }
}
