import 'package:flutter/material.dart';

class DrawerDemo extends StatefulWidget {
  DrawerDemo({Key key}) : super(key: key);

  @override
  _DrawerDemoState createState() => _DrawerDemoState();
}

class _DrawerDemoState extends State<DrawerDemo> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: 5,
        itemBuilder: (context, index) {
          if (index == 0) {
            return UserAccountsDrawerHeader(
              accountName: Text("用户名: 暴走丢丢"),
              accountEmail: Text("邮箱: diudiu_WangChen@163.com"),
              currentAccountPicture: CircleAvatar(
                child: Image.asset("images/logo.png"),
              ),
            );
          } else if (index == 1) {
            return ListTile(
              title: Text("首页"),
              leading: Icon(Icons.home),
              selected: true,
            );
          } else if (index == 2) {
            return ListTile(
              title: Text("翻译收藏夹"),
              leading: Icon(Icons.collections),
            );
          } else if (index == 3) {
            return ListTile(
              title: Text("离线翻译"),
              leading: Icon(Icons.transit_enterexit),
            );
          } else if (index == 4) {
            return ListTile(
              title: Text("设置"),
              leading: Icon(Icons.settings_applications),
            );
          }else {
            return ListTile(
              title: Text("设置"),
              leading: Icon(Icons.settings_applications),
            );
          }
        },
      ),
    );
  }
}
