import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/api/api_settings.dart';
import 'package:news_app/models/news_models.dart';

class NewsController extends GetxController {
  RxInt currentIndex=0.obs;



  getData(String cat) async {
    final url = Uri.parse("https://newsapi.org/v2/top-headlines?country=eg&category=${cat}&apiKey=e495a3b38f53443cb994c43a566d08f1");
    var response = await http.get(url);


    if(response.statusCode==200){
      try{
        return NewsModels.fromJson(jsonDecode(response.body));

      }catch(e){
        Get.snackbar("error",e.toString());
      }
    }
  }
}
