import 'package:flutter/material.dart';

class ListViewRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("美团"),
      ),
      body: InfiniteListView(),
    );
  }
}

class InfiniteListView extends StatefulWidget {
  @override
  _InfiniteListViewState createState() => new _InfiniteListViewState();
}

class _InfiniteListViewState extends State<InfiniteListView> {
  var words = <String>[];

  @override
  void initState() {
    super.initState();
    generateData();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: words.length,
      itemBuilder: (context, index) {
        return Flex(
          direction: Axis.horizontal,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 100,
              height: 100,
              padding: const EdgeInsets.all(10),
              child: Image(
                image: NetworkImage(
                    "https://p1.meituan.net/200.0/deal/6a9432e43cec04a7aa03a9839285c4be57161.jpg@118_0_466_466a%7C267h_267w_2e_90Q"),
                width: 80,
              ),
            ),
            Expanded(
                child: Container(
              height: 100,
              padding: EdgeInsets.fromLTRB(0, 10, 10, 10),
              child: Flex(
                direction: Axis.vertical,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("麦当劳", style: TextStyle(color: Color(0xff666666))),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 2, 0, 2),
                    child: Text(
                      "[祖庙]超值商务套餐",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                  Expanded(child: Container()),
                  Flex(
                    direction: Axis.horizontal,
                    children: [
                      Text("11.7元", style: TextStyle(color: Color(0xffff6600))),
                      Expanded(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [Text("售罄")],
                      )),
                    ],
                  )
                ],
              ),
            )),
          ],
        );
      },
      separatorBuilder: (context, index) => Divider(height: .0),
    );
  }

  void generateData() {
    words.add("1");
    words.add("2");
    words.add("3");
    words.add("4");
    words.add("5");
    words.add("6");
    words.add("7");
  }
}
