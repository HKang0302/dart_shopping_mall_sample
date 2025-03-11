class Product {
  late String name;
  late int price;
  late int quantity;

  Product(this.name, this.price, this.quantity);
}

class Products {
  static List<Product> products = [];

  void addProduct(String name, int price, int quantity) {
    try {
      products.indexWhere((product) => product.name == name) == -1
          ? products.add(Product(name, price, quantity))
          : throw '이미 존재하는 상품입니다.';
      print('${name} 상품이 추가되었습니다.');
    } catch (e) {
      print(e.toString());
    }
  }

  void removeProduct(String name) {
    try {
      int index = products.indexWhere((element) => element.name == name);
      if (index == -1) throw '존재하지 않는 상품입니다.';
      Product product = products[index];
      products.removeWhere((element) => element.name == name);
      print('${product.name} 상품이 삭제되었습니다.');
    } catch (e) {
      print(e.toString());
    }
  }

  void modifyQuantity(String name, int quantity) {
    try {
      int index = products.indexWhere((element) => element.name == name);
      if (index == -1) throw '존재하지 않는 상품입니다.';
      Product product = products[index];
      print(
        '${product.name} 상품의 현재 수량이 ${product.quantity}개에서 ${quantity}개로 변경됩니다.',
      );
      products[index].quantity = quantity;
    } catch (e) {
      print(e.toString());
    }
  }

  void showProducts() {
    for (var product in products) {
      print('${product.name} / ${product.price}원 / ${product.quantity}개');
    }
  }

  void clearProducts() {
    products.clear();
    print('상품 목록이 초기화되었습니다.');
  }

  void getDefaultProducts() {
    products = [
      Product('셔츠', 45000, 10),
      Product('원피스', 30000, 20),
      Product('반팔티', 35000, 30),
      Product('반바지', 38000, 40),
      Product('양말', 5000, 50),
    ];
    print('기본 상품 목록으로 초기화되었습니다.');
  }
}
