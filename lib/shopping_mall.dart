import 'dart:io';
import 'package:mall/product.dart';

class ShoppingMall {
  List<Product> cart = [];
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
      int remainingQuantity =
          Products.products
              .firstWhere((element) => element.name == name)
              .quantity;
      if (quantity > remainingQuantity) {
        throw '재고가 부족합니다. (남은 재고 ${remainingQuantity})';
      }

      // 장바구니에 추가
      int index = cart.indexWhere((item) => item.name == name);
      if (index > -1) {
        cart[index].quantity += quantity;
        totalCartPrice += cart[index].price * quantity;
      } else {
        int price =
            Products.products.firstWhere((item) => item.name == name).price;
        cart.add(Product(name, price, quantity));
        totalCartPrice += price * quantity;
      }
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
    // print('장바구니에 ${cart.join(', ')}가 담겨있네요. 총 ${totalCartPrice}원 입니다!');
    print(
      '장바구니에 ${cart.map((item) => '${item.name}(${item.quantity}개)')}가 담겨있네요. 총 ${totalCartPrice}원 입니다!',
    );
  }

  void purchaseCart() {
    if (cart.isEmpty || totalCartPrice == 0) {
      print('장바구니에 담긴 상품이 없습니다.');
      return;
    }
    print('장바구니에 담긴 상품을 구매합니다. ${totalCartPrice}원이 결제됩니다.');
    for (Product product in cart) {
      Products
          .products
          .firstWhere((element) => element.name == product.name)
          .quantity -= product.quantity;
    }

    cart.clear();
    totalCartPrice = 0;

    print('결제가 완료되었습니다.');
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
