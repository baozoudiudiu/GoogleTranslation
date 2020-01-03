import 'package:flutter/material.dart';
import '../conponent/drawer_demo.dart';
import '../conponent/home_header.dart';
import '../conponent/textview.dart';

class IndexPage extends StatefulWidget {
  IndexPage({Key key}) : super(key: key);

  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  List<TestModel> dataArr = [
    TestModel(srcString: "drawer", desString: "抽屉"),
    TestModel(srcString: "span", desString: "跨度"),
    TestModel(srcString: "scale", desString: "规模"),
    TestModel(srcString: "factor", desString: "因子"),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Google Translation"),
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              HomeHeader(),
              HomeTextViewDemo(),
              SizedBox(
                height: 16.0,
              ),
              Expanded(
                child: Container(
                  color: Color.fromRGBO(1, 1, 1, 0),
                  padding: EdgeInsets.only(
                    left: 8.0,
                    right: 8.0,
                  ),
                  child: Card(
                    child: ListView.separated(
                      physics: BouncingScrollPhysics(),
                      separatorBuilder: (BuildContext context, int index) {
                        return Divider(
                          height: 1.0,
                          color: Colors.grey[300],
                        );
                      },
                      itemCount: this.dataArr.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          title: Text("${this.dataArr[index].srcString}"),
                          subtitle: Text("${this.dataArr[index].desString}"),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        drawer: DrawerDemo(),
      ),
    );
  }
}

class TestModel {
  final String srcString;
  final String desString;

  TestModel({
    @required this.srcString,
    @required this.desString,
  });
}
