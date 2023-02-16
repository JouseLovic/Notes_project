import 'package:notes_project/Widgets/CustomCard.dart';

import '../model/Note.dart';

class noteController{

  static int? idCard;
  static List<int> ids = [];//this for that the user can delete some files the same time
  static customCard? cusCard;
  static List<note> _listaNotas = [
    note("Hola", "Contenido", DateTime.now(), 0),//this can nullable if is: [];
  ];

  static void getIdCard(customCard card){
      idCard = card.getIdCard();
      cusCard = card;
  }

  static List<note> getList(){
    return _listaNotas;
  }

  static void addCustomCard(note Note){
    _listaNotas.insert(0, Note);
    print(_listaNotas.length);
  }

  //ahora hay que crear metodos para recorrer y encontrar lo que quermeos,
  //de todas formas, recuerda que List se puede recorrer como un array comun y corriente
  //a pesar de que parezca una puta coleccion


  /*Haremos algo super sencillo, para poder mandar la informacion a otra ventana donde la visualicemos
  lo que haremos es que, apenas se toque el dicho customCard, se cree un objeto de tipo note, y llamemos 
  a la otra pagina, a la cual debemos pasarle ese objeto note, y con ese mismo estructuraremos la informacion
  dentro de esa pagina. De esa forma, no tendremos complicaciones al encontrar la informacion, ya que la misma
  se tomara del customCard, hacia la note y de alli lo demas es facil

  para la ediciond de la misma, lo que haremos es que se tome como paremos tambien el id de dicha card
  y que cuando se actualice, se envien los nuevos datos a la lista (borrando la que tenia el id, y añadiendo la nueva) con insert
  De esta forma, todo sera mas sencillo
  
  */

}