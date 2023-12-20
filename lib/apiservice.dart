
import 'dart:convert';

import 'package:http/http.dart';
import 'package:newsapp/model.dart';

class allnewsservice {
  final all_news= "https://newsapi.org/v2/everything?q=programing&apiKey=b5cd8ce8bd4540d697107c5087d79c85";

  Future<List<models>> getAllNews() async {
      try {
      Response response = await get(Uri.parse(all_news));
      if (response.statusCode == 200) {
        Map<String, dynamic> json = jsonDecode(response.body);
        List<dynamic> body = json['articles'];
        List<models> articles =
        body.map((dynamic item) => models.fromJson(item)).toList();
        return articles;
      } else {
        throw ("No artile found");
      }
    } catch (e) {
      throw (e.toString());
    }
}




}