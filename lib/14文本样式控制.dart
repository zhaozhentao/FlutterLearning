import 'package:flutter/material.dart';

class TextStyleRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("文本样式"),
      ),
      body: Content(),
    );
  }
}

class Content extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Text(
            "Hello world",
            textAlign: TextAlign.left,
          ),
          Text(
            "Hello world! I'm Jack. " * 4,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            "Hello world",
            textScaleFactor: 1.5,
            style: TextStyle(
              color: Color(0xffff0000)
            ),
          )
        ],
      ),
    );
  }
}
