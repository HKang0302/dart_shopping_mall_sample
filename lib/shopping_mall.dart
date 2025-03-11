import 'dart:io';
import 'package:mall/product.dart';

class ShoppingMall {
  List<String> cart = [];
  int totalCartPrice = 0;

  void showProducts() {
    for (var product in Products.products) {
      print('${product.name} / ${product.price}원');
    }
  }

  bool isProductExist(Object object) {
    for (Product product in Products.products) {
      if (product.name == object) {
        return true;
      }
    }
    return false;
  }

  void addToCart() {
    late String name;
    late int? quantity;
    try {
      // 상품 이름 입력
      print('상품 이름을 입력해 주세요 !');
      name = stdin.readLineSync() ?? '';
      if (!isProductExist(name)) throw '입력값이 올바르지 않아요 !';

      // 상품 개수 입력
      print('상품 개수를 입력해 주세요 !');
      String tmpQuantity = stdin.readLineSync() ?? '';
      quantity = int.tryParse(tmpQuantity);
      if (quantity == null) throw '입력값이 올바르지 않아요 !';
      if (quantity <= 0) throw '0개보다 많은 개수의 상품만 담을 수 있어요 !';

      // 장바구니에 추가
      if (!cart.contains(name)) cart.add(name);
      totalCartPrice +=
          Products.products
              .firstWhere((element) => element.name == name)
              .price *
          quantity;
      print('장바구니에 상품이 담겼어요 !');
    } catch (e) {
      print(e.toString());
      return;
    }
  }

  void showTotal() {
    if (cart.isEmpty || totalCartPrice == 0) {
      print('장바구니에 담긴 상품이 없습니다.');
      return;
    }
    print('장바구니에 ${cart.join(', ')}가 담겨있네요. 총 ${totalCartPrice}원 입니다!');
  }

  void initCart() {
    print('장바구니를 초기화합니다.');
    if (cart.isEmpty || totalCartPrice == 0) {
      print('이미 장바구니가 비어있습니다.');
      return;
    }
    cart.clear();
    totalCartPrice = 0;
  }
}
