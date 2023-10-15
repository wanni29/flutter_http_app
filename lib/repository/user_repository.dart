import 'package:dio/dio.dart';
import 'package:flutter_http_app/model/user.dart';

// Flutter 세계관 안에서는 레포지토리의 책임은 통신과 파싱이야! , 기억해!
// class UserRepository {
//   User fetchUser(int id) {
//     // 1. 통신 코드
//     // 2. 통신으로 받은 데이터 타입 : Map
//     // 3. Map -> Dart.Object
//     // 4. return Dart.Object
//     return User(
//         id: 1, username: "ssar", password: "1234", email: "ssar@nate.com");
//   }
//
//   List<User> fetcherUserList() {
//     // 1. 통신 코드
//     // 2. 통신으로 받은 데이터 타입 : Map
//     // 3. Map -> Dart.Object
//     // 4. return Dart.Object
//
//     List<User> userList = [
//       User(id: 1, username: "ssar", password: "1234", email: "ssar@nate.com"),
//       User(id: 2, username: "cos", password: "1234", email: "cos@nate.com"),
//       User(id: 3, username: "love", password: "1234", email: "love@nate.com"),
//     ];
//
//     return userList;
//   }
// }

final dio = Dio(BaseOptions(baseUrl: "http://192.168.0.17:8080"));

class UserRepository {
  Future<List<User>> fetchUserList() async {
    // 제이슨 데이터를 다트세계관에 진입하기 위해 다트 세계관 문앞에 대기
    Response<dynamic> response = await dio.get("/user");
    print(response.data);

    // 리스트 타입이기에 속성이 바뀌기 전 원소 하나하나를 꺼내 바뀔 리스트에 투입
    List<dynamic> bodyList = response.data as List<dynamic>;

    // 제이슨 데이터 다트세계관안에 진입 -> 제이슨 데이터는 맵형식으로 자신의 속성이 바뀜
    // 바인딩을 시도해서 맵형식을 하나의 객체로 담는 코드에요!
    List<User> userList = bodyList.map((e) => User.fromJson(e)).toList();
    // 여기에서의 map(streamAPI에서 가공하는 문법 - map) 과 map (데이터 타입의 한 종류 - map)은 다른거야.

    return userList;
  }

  Future<User> fetchUser(int id) async {
    // 제이슨 데이터를 다운받고
    Response<dynamic> response = await dio.get("/user/$id");
    print(response.data);

    // 제이슨 데이터를 맵타입으로 다운 캐스팅을 시도
    Map<String, dynamic> body = response.data as Map<String, dynamic>;
    print(body["username"]);

    // 맵타입의 데이터를 다트객체로 제작
    User user = User.fromJson(body);
    return user;
  }
}
