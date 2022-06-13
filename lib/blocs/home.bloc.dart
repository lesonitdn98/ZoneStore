import 'package:rxdart/rxdart.dart';
import 'package:zone_store/models/product.dart';

class HomeBloc {
  final _loading = BehaviorSubject<bool>();
  final _loadingMess = BehaviorSubject<String>();
  final _isLogin = BehaviorSubject<bool>();
  final _inCart = BehaviorSubject<List<Product>>();

  Stream<bool> get loading => _loading.stream;
  void setLoading({required bool isLoading, String? messager}) {
    _loading.sink.add(isLoading);
    _loadingMess.sink.add(messager ?? "");
  }

  String get loadingMess => _loadingMess.value;

  Stream<List<Product>> get getCart => _inCart.stream;
  void addProductToCart(Product product) {
    if (!_inCart.hasValue) {
      _inCart.sink.add([product]);
    } else {
      List<Product> hihi = _inCart.value;
      hihi.add(product);
      _inCart.sink.add(hihi);
    }
  }

  void removeProductToCart(Product product) {
    if (_inCart.hasValue)
      _inCart.value.removeWhere((item) => item.id == product.id);
  }

  void dispose() {
    _loading.close();
    _loadingMess.close();
    _inCart.close();
  }
}
