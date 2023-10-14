import 'package:flutter/material.dart';
import 'package:flutter_http_app/model/user.dart';
import 'package:flutter_http_app/repository/user_repository.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: UserListPage(),
    );
  }
}

class UserListPage extends StatelessWidget {
  const UserListPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Stateless 이기때문에 한번만 데이터가 오기때문에
    // 그려지기 직전에 데이터가 준비 되어있어야한다.
    UserRepository ur = UserRepository();
    List<User> userList = ur.fetcherUserList();

    return Scaffold(
      body: ListView.builder(
        itemCount: userList.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Text("${userList[index].id}"),
            title: Text("${userList[index].username}"),
            subtitle: Text("${userList[index].email}"),
          );
        },
      ),
    );
  }
}
