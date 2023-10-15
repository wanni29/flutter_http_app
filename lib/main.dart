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
      home: UserPage(),
    );
  }
}

// 여러 데이터를 처리하는 로직
class UserListPage extends StatelessWidget {
  const UserListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<User>>(
        future: UserRepository().fetchUserList(),
        builder: (context, snapshot) {
          print("그림 그려짐!!!!!!!");
          if (snapshot.hasData) {
            // 통신이 끝남
            List<User> userList = snapshot.data ?? [];
            return ListView.builder(
              itemCount: userList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Text("${userList[index].id}"),
                  title: Text("${userList[index].username}"),
                  subtitle: Text("${userList[index].email}"),
                );
              },
            );
          } else {
            // 통신중인 상태
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

// 단일 데이터를 처리하는 로직
class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<User>(
        future: UserRepository().fetchUser(1),
        builder: (context, snapshot) {
          print("1 그림 그려짐!!!");
          if (snapshot.hasData) {
            User user = snapshot.data ?? User();
            return ListView.builder(
              itemCount: 1,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Text("${user.id}"),
                  title: Text("${user.username}"),
                  subtitle: Text("${user.email}"),
                );
              },
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
