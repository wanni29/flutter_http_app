// 1. 엔티티와 동일한 모델을 만든다.
// 2. 서버측에서 보내는 디티오는 아직까지 안 만든다고 생각하면 된다.
// Model => 서버로부터 받을 데이터 타입을 정의(서버측 테이블과 동일하게 만들면 됨)

class User {
  int? id;
  String? username;
  String? password;
  String? email;

  User({this.id, this.username, this.password, this.email});

  User.fromJson(Map<String, dynamic> json) {
    // 이 코드가 디비(스프링) 쪽에서 제이슨 타입(스트링)을 받아서 맵타입으로 파싱하는거야 !
    id = json["id"];
    username = json["username"];
    password = json["password"];
    email = json["email"];
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "username": username,
      "password": password,
      "email": email
    };
  }
}
