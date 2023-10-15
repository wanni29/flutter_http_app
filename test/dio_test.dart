import 'package:dio/dio.dart';
import 'package:flutter_http_app/model/user.dart';

final dio = Dio();

void main() async {
  // 코드가 어떻게동작하는걸까 ?
  // 처음에 비동기 함수를 이해하기 위해선 2명의 친구에 대한 역할을 알고있어야 한다.
  // CPU - 그림을 그릴수 있는 친구 / RAM - 무엇을 그려야 할지 아는 친구
  /*
   *  코드의 동작 구성
   *  1. 처음에 CPU가 코드 한줄 한줄씩 해석해 나가다가 await 저 부분 있지 ?
   *  2. 그부분에서 RAM이라는 친구에게 이야기한다
   *  -> "야, 너가 여기서 다운받기까지 기달려 그리고 나를 부르면 내가 그림그리러 올테니까. 다운 다 받구 불러 알겠지?"
   *  3. 그리고는 CPU는 메소드 자체를 빠져 나간다.
   *  4. 몇초 뒤에 RAM이 다운을 다 받고 CPU에게 이야기한다.
   *  5. "다운 끝났어. 이제 그려줘"
   *  6. 그러면 CPU는 그림을 마져 그리고 코드가 끝난다
   */

  await fetchUser_test(1);
}

Future<User> fetchUser_test(int id) async {
  // 데이터 받기 -> map타입으로 변환
  Response<dynamic> response =
      await dio.get("http://192.168.0.17:8080/user/$id");
  print(response.data); // response.data - 헤드데이터는 무시하고 난 바디데이터만 들고와요!

  // 다운캐스팅 -> Json데이터(String)를 맵타입으로
  Map<String, dynamic> body =
      response.data as Map<String, dynamic>; // 나는 다운캐스팅을 진행하는 코드에요!
  print(body["username"]); // 다트세계관에서는 겟터와 셋터가 없기 때문에 이런식으로 값을 꺼내와요!

  // 맵타입을 오브젝트타입으로 변환
  User user = User.fromJson(body);

  return user;
}
