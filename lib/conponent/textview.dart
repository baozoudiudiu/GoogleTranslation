import 'package:flutter/material.dart';

class HomeTextViewDemo extends StatefulWidget {
  HomeTextViewDemo({Key key}) : super(key: key);

  @override
  _HomeTextViewDemoState createState() => _HomeTextViewDemoState();
}

class _HomeTextViewDemoState extends State<HomeTextViewDemo> {
  double _leftpadding = 16.0;
  double _rightpadding = 16.0;
  double _toppadding = 4.0;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(0.0),
      child: Container(
        padding: EdgeInsets.only(
            left: _leftpadding, right: _rightpadding, top: _toppadding),
        width: double.infinity,
        height: 200.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // 输入框
            Container(
              child: Expanded(
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "点击此处可输入文本",
                    border: InputBorder.none,
                  ),
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25.0,
                  ),
                  maxLines: 10,
                ),
              ),
            ),
            // 底部菜单栏
            Row(
              children: <Widget>[
                Expanded(
                  child: MenuButton(
                    icon: Icon(
                      Icons.camera_alt,
                      color: Theme.of(context).primaryColor,
                    ),
                    titleString: "相机",
                  ),
                ),
                Expanded(
                  child: MenuButton(
                    icon: Icon(
                      Icons.pan_tool,
                      color: Theme.of(context).primaryColor,
                    ),
                    titleString: "手写",
                  ),
                ),
                Expanded(
                  child: MenuButton(
                    icon: Icon(
                      Icons.phone_in_talk,
                      color: Theme.of(context).primaryColor,
                    ),
                    titleString: "对话",
                  ),
                ),
                Expanded(
                  child: MenuButton(
                    icon: Icon(
                      Icons.voice_chat,
                      color: Theme.of(context).primaryColor,
                    ),
                    titleString: "语音",
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class MenuButton extends StatelessWidget {
  final String titleString;
  final Icon icon;

  const MenuButton({
    Key key,
    this.titleString,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FlatButton(
        onPressed: (){},
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 8.0,
            ),
            this.icon,
            SizedBox(
              height: 8.0,
            ),
            Text("${this.titleString}"),
            SizedBox(
              height: 8.0,
            ),
          ],
        ),
      ),
    );
  }
}
