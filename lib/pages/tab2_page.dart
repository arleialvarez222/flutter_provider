import 'package:flutter/material.dart';
import 'package:new_provider/models/category_model.dart';

import 'package:new_provider/services/news_service.dart';
import 'package:new_provider/theme/theme.dart';
import 'package:new_provider/widgets/lista_noticias.dart';
import 'package:provider/provider.dart';


class Tab2Page extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final newsService = Provider.of<NewsService>(context);
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
    
            _ListaCategorias(),

            Expanded(
              child: ListaNoticias(newsService.getArtCatSelct!),
            ),
    
          ],
        )
       ),
    );
  }
}

class _ListaCategorias extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {

    final categories = Provider.of<NewsService>(context).categories;

    return Container(
      width: double.infinity,
      height: 200,
      //margin:  EdgeInsets.symmetric(vertical: 30),
      child: ListView.builder(
        physics:  BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (BuildContext context, int index) {

          final cName = categories[index].name;

          return Padding(
            padding: EdgeInsets.all(8),
            child: Column(
              children: <Widget>[
                _CategoryBotton(categories[index]),
                SizedBox(height: 5),
                Text('${cName[0].toUpperCase()}${cName.substring(1)}'),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _CategoryBotton extends StatelessWidget {

  final Category category;

   const _CategoryBotton(this.category);

  @override
  Widget build(BuildContext context) {

    final newsService = Provider.of<NewsService>(context);

    return GestureDetector(
      onTap: (){
        //print('${category.name}');
        final newsService = Provider.of<NewsService>(context, listen: false);
        newsService .selectedCategory = category.name;
      },
      child: Container(
        width: 40,
        height: 40,
        margin: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ),
        child: Icon(
          category.icon,
          color: (newsService.selectedCategory == category.name)
                ? miTema.colorScheme.secondary
                : Colors.black54
        ),
    
      ),
    );
  }
}