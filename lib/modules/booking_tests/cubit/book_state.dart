part of 'book_cubit.dart';

@immutable
abstract class BookState {}

class BookInitial extends BookState {}

class BookChangeBottomNavBarState extends BookState {}

class BookCreateDBStateState extends BookState {}

class BookInsertIntoDBState extends BookState {}

class BooklodingDataState extends BookState {}

class BookGetDataFromDBState extends BookState {}

class BookDeleteDataDBState extends BookState {}

class BookToggelRadioValueState extends BookState {}

class BookChangePageNumberState extends BookState {}
