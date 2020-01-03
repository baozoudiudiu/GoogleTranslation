import 'package:flutter/material.dart';
import 'dart:ui';

class HomeHeader extends StatefulWidget {
  @override
  _HomeHeaderState createState() => _HomeHeaderState();
}

class _HomeHeaderState extends State<HomeHeader> {

  String _srcString = "英语";
  String _desString = "中文(简体)";

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        minHeight: 55.0,
        maxHeight: 110.0,
      ),
      padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 8.0, bottom: 8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(
            width: 0.5,
            color: Colors.grey[400],
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // 被翻译的语言
          Expanded(
            child: HomeHeaderTile(
              titleString: _srcString,
              mainAxisAlignment: MainAxisAlignment.start,
              wrapAlignment: WrapAlignment.start,
              maxWidth: MediaQuery.of(context).size.width * 0.5 - 40,
              selectedBlock: (value) {
                setState(() {
                  _srcString = value;
                });
              },
            ),
          ),
          // 中间的切换按钮
          SizedBox(
            width: 40.0,
            child: Icon(
              Icons.exposure,
              color: Theme.of(context).primaryColor,
            ),
          ),
          // 翻译成的目标语言
          Expanded(
            child: HomeHeaderTile(
              titleString: _desString,
              mainAxisAlignment: MainAxisAlignment.end,
              wrapAlignment: WrapAlignment.end,
              maxWidth: MediaQuery.of(context).size.width * 0.5 - 40,
              selectedBlock: (value) {
                setState(() {
                  _desString = value;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}

class HomeHeaderTile extends StatelessWidget {
  final String titleString;
  final MainAxisAlignment mainAxisAlignment;
  final WrapAlignment wrapAlignment;
  final double maxWidth;
  final void Function(String) selectedBlock;
 
  const HomeHeaderTile({
    Key key,
    @required this.titleString,
    @required this.mainAxisAlignment,
    @required this.wrapAlignment,
    @required this.maxWidth,
    this.selectedBlock,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: () {},
        child: Material(
          color: Colors.white,
          child: Row(
            mainAxisAlignment: this.mainAxisAlignment,
            children: <Widget>[
              ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: this.maxWidth - 20,
                ),
                child: Wrap(
                  alignment: this.wrapAlignment,
                  children: <Widget>[
                    Text(
                      "${this.titleString}",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              PopupMenuButton(
                icon: Icon(
                  Icons.arrow_drop_down,
                  color: Theme.of(context).primaryColor,
                ),
                itemBuilder: (context) {
                  return [
                    PopupMenuItem(
                      value: "英语",
                      child: Text("英语"),
                    ),
                    PopupMenuItem(
                      value: "中文(简体)",
                      child: Text("中文(简体)"),
                    ),
                    PopupMenuItem(
                      value: "中文(繁体)",
                      child: Text("中文(繁体)"),
                    ),
                  ];
                },
                onSelected: (value) {
                  if(null != this.selectedBlock)
                  {
                    this.selectedBlock(value);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
