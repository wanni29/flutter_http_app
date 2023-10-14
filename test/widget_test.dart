import 'package:flutter_http_app/model/user.dart';

void main() {
  // 1. User 객체 만들기
  User u1 =
      User(id: 1, username: "ssar", password: "1234", email: "ssar@nate.com");

  // 2. User 맵타입 만들기
  Map<String, dynamic> u2 = {
    "id": 2,
    "username": "cos",
    "password": "1234",
    "email": "cos@nate.com"
  };
  print(u2["username"]);

  // 3. map -> Object 변환 (수신)
  User u3 = User.fromJson(u2);
  print(u3.username);

  // 4. dart.object -> map (발신) : 왜 Json 으로 안바꿀까 ? 알아서 map 을 json으로 바꾸니까 누가 ? 메세지 컨버터가
  Map<String, dynamic> u4 = u3.toJson();
  print(u4["username"]);
}
