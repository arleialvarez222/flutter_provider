import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:new_provider/models/category_model.dart';
import 'package:new_provider/models/news_models.dart';
import 'package:http/http.dart' as http;

const String _URL_NEWS = 'https://newsapi.org/v2';
const String _APIKEY = '7b7ddd4be41d45b7911a4fffaaab504e';


class NewsService with ChangeNotifier{

  List<Article> headLines = [];
  String _selectedCategory = 'business';

  List<Category> categories = [
    Category(FontAwesomeIcons.building, 'business'),
    Category(FontAwesomeIcons.tv, 'entertainment'),
    Category(FontAwesomeIcons.addressCard, 'general'),
    Category(FontAwesomeIcons.headSideVirus, 'health'),
    Category(FontAwesomeIcons.vials, 'science'),
    Category(FontAwesomeIcons.volleyballBall, 'sports'),
    Category(FontAwesomeIcons.memory, 'technology'),
  ];

  Map<String, List<Article>> categoryArticles = {};

  NewsService(){

    getTopHeadLines();

    categories.forEach((item) { 
      categoryArticles[item.name] = [];
    });

  }

  String get selectedCategory => _selectedCategory;

  set selectedCategory (String valor){
    _selectedCategory = valor;
    getArticlesByCategory(valor);

    notifyListeners();
  }

  List<Article>? get getArtCatSelct => categoryArticles[selectedCategory];

  getTopHeadLines() async{
    
    final url = Uri.parse('$_URL_NEWS/top-headlines?apiKey=$_APIKEY&country=co');

    final respuesta = await http.get(url);

    final newsResponse = NewResponse.fromJson(respuesta.body);

    headLines.addAll(newsResponse.articles!);
    notifyListeners();

  }

  getArticlesByCategory(String category) async{

    if(categoryArticles[category]!.length > 0){
      return categoryArticles[category];
    }
    
    final url = Uri.parse('$_URL_NEWS/top-headlines?apiKey=$_APIKEY&country=co&category=$category');

    final respuesta = await http.get(url);

    final newsResponse = NewResponse.fromJson(respuesta.body);
    categoryArticles[category]?.addAll(newsResponse.articles!);

    notifyListeners();

  }


}