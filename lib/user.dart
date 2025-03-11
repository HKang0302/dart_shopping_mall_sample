import 'package:mall/my_mall.dart';

class Users {
  static List<User> users = [];

  static void addUser(String id, String password) {
    users.add(User(id, password));
  }

  static User? findUser(String id) {
    for (User user in users) {
      if (user.id == id) {
        return user;
      }
    }
    return null;
  }
}

class User {
  String id;
  String password;
  late MyMall myMall;

  User(this.id, this.password) {
    myMall = MyMall();
  }
}
