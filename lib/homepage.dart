import 'package:flutter/material.dart';
import 'package:newsapp/apiservice.dart';
import 'package:newsapp/itemlist.dart';
import 'package:newsapp/model.dart';



class AllNews extends StatefulWidget {
  const AllNews({Key? key}) : super(key: key);

  @override
  State<AllNews> createState() => _AllNewsState();
}

class _AllNewsState extends State<AllNews> {
  allnewsservice AllNewsservice = allnewsservice();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: AllNewsservice.getAllNews(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<models> model = snapshot.data ?? [];
            return ListView.builder(itemBuilder: (context, index) {
              List<models> model = snapshot.data ?? [];
              return NewsListItem(articleModel: model[index]);
            },itemCount: model.length,);
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}