
import '../model/Note.dart';

class noteController{

  static int? idNote;
  static note? Notes;
  static List<int> ids = [];//this for that the user can delete some files the same time
  static List<note> _listaNotas = [
    note("Hola", "Contenido", DateTime.now(), 0, true, DateTime.now()),//this can nullable if is: [];
  ];

  static List<note> _listAllNotes = _listaNotas;

  static List<note> _listFavoriteNotes= [
    note("Recetas", "Contenido de las recetas", DateTime.now(), 0, true, DateTime.now()),//this can nullable if is: [];

  ];
  static List<note> _listNotFavoriteNotes= [
    note("", "Contenido", DateTime.now(), 0, false, DateTime.now()),//this can nullable if is: [];
  ];

  static void getIdCard(note Note){
      idNote = Note.getKey();
      Notes = Note;
  }

  static List<note> getList(String? search){//hay que probar esto
    if(search!=""){
       for(int i=0; i<_listaNotas.length;i++){
            if(_listaNotas[i].getTitle()==search){
              _listaNotas.removeWhere((search) => _listaNotas[i].getTitle()!=search);
               return _listaNotas;
            }
       }
    }
     return _listaNotas;
  }

  static void fillList(){
       for(int i=0; i<_listaNotas.length;i++){
      if(_listaNotas[i].getFavorite()==true && _listaNotas[i].getKey()!=0){
          _listFavoriteNotes.insert(0, _listaNotas[i]);
      }
      else{
          _listNotFavoriteNotes.insert(0, _listaNotas[i]);
      }
    }
  }

  static List<note> getListFavorite(){
    return _listFavoriteNotes;
  }

  static List<note> getListNotFavorite(){
    return _listNotFavoriteNotes;
  }

  static void setFavorite(int index, bool state){
      _listaNotas[index].setFavorite(state);
  }

  static void setUpdateNote(int index, note Note){
      _listaNotas[index].setTitle(Note.getTitle());
      _listaNotas[index].setContent(Note.getContent());
      _listaNotas[index].setDateModification(DateTime.now());
  }

  static void removeNote(int index){
      _listaNotas.removeAt(index);
  }
  
  static bool isSearch(String? search){
    if(search != null){
         return true;
      }
     return false;
  }

  static void addCustomCard(note Note){
    _listaNotas.insert(0, Note);
    print(_listaNotas.length);
  }

}