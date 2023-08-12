import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:sqflite/sqflite.dart';

part 'book_state.dart';
class BookCubit extends Cubit<BookState> {
  BookCubit() : super(BookInitial());
  static BookCubit get(context)=> BlocProvider.of(context);
  late Database database;
  
  String gender = 'Male';
  
  List<Map> newTests=[];
  
  
  void toggelRadioValue(value){
     gender=value!;
     emit(BookToggelRadioValueState());
  }


   void createDb()  {
     openDatabase('Book.db', version: 1,
        onCreate: (database, version) {
      print('database created ');
      database
          .execute(
              'create table Tests ( id integer primary key,name text,type text, time text, date text, gender text)')
          .then((value) {
        print('Tables created');
      }).catchError((error) {
        print('error: ${error.toString()}');
      });
    }, onOpen: (database) {
        getDataFromDB(database);
        print('database opened');
      },
    ).then((value){
      database=value;
      emit(BookCreateDBStateState());
    });
  }


  Future InsertToDatabase(
    {
    required String name,
    required String type,
    required String time,
    required String date,
    required String gender,
  }
  ) async {
     await database.transaction((txn) {
      return txn
          .rawInsert(
              'INSERT INTO Tests(name,type,time,date,gender) VALUES("$name","$type","$time","$date","$gender")')
          .then((value) {
        print('$value records created well ');
        emit(BookInsertIntoDBState());
        getDataFromDB(database);
      }).catchError((error) {
        print('insert row error: ${error.toString()}');
      });
    });
  }

  void getDataFromDB(database)  {
    newTests=[];
    emit(BooklodingDataState());
    database.rawQuery('SELECT * FROM Tests').then((value){
       value.forEach((element){
        newTests.add(element);
       });

    emit(BookGetDataFromDBState());

    });
  }


void deleteData(
    {
      required int id,
    }
  )async{
   database.rawDelete(
    'Delete FROM Tests  WHERE id = ?',
    [id]).then((value){
      getDataFromDB(database) ;
      emit(BookDeleteDataDBState());
    });
  }

}





