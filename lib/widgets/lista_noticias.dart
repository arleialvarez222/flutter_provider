import 'package:flutter/material.dart';
import 'package:new_provider/models/news_models.dart';
import 'package:new_provider/theme/theme.dart';

class ListaNoticias extends StatelessWidget {

  final List<Article> noticias;

  const ListaNoticias(this.noticias);


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      
      itemCount: noticias.length,
      itemBuilder: (BuildContext context, int index) {
        return _Noticia(noticia: noticias[index], index: index,);
      }
    );
  }
}



class _Noticia extends StatelessWidget {

  final Article noticia;
  int index;

  _Noticia({ 
    required this.noticia,
    required this.index,
    });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[

        _TarjetaTopBar(noticia, index),

        _TarjetaTitulo(noticia),

        _TarjetaImagenes(noticia),

        _TarjetaBody(noticia),

        _TarjetaBotones(),

        SizedBox(height: 10,),

        Divider(),

      ],
      
    );
  }
}


class _TarjetaTitulo extends StatelessWidget {

  final Article noticia;

  _TarjetaTitulo( this.noticia );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Text(noticia.title!, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),),
    );
  }
}

class _TarjetaImagenes extends StatelessWidget {

  final Article noticia;

  _TarjetaImagenes(this.noticia);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(50), bottomRight: Radius.circular(50)),
        child: Container(
          child: (noticia.urlToImage != null)
            ? FadeInImage(
                placeholder: AssetImage('assets/img/giphy.gif'), 
                image: NetworkImage(noticia.urlToImage!),
              )
            : Image(image: AssetImage('assets/img/no-image.png'),)
        ),
      ),
    );
  }
}

class _TarjetaBody extends StatelessWidget {

  final Article noticia;

  const _TarjetaBody(this.noticia);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child:  Text(noticia.description ?? ''),
      
    );
  }
}

class _TarjetaBotones extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[

          RawMaterialButton(
            onPressed: (){},
            fillColor: miTema.colorScheme.secondary,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Icon(Icons.star)
          ),

          SizedBox(width: 10),

          RawMaterialButton(
            onPressed: (){},
            fillColor: Colors.blue,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Icon(Icons.more)
          ),

        ],
      ),
    );
  }
}

class _TarjetaTopBar extends StatelessWidget {

  final Article noticia;
  final int index;

  _TarjetaTopBar(this.noticia, this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      margin: EdgeInsets.only(bottom: 10),
      child: Row(
        children: <Widget>[
          Text('${ index + 1 }. ', style: TextStyle(color: miTema.colorScheme.secondary), ),
          Text('${ noticia.source!.name }. ' ),
        ],
      )
    );
  }
}