// import 'dart:async';

// import 'package:sembast/sembast.dart';
// import 'package:sembast/sembast_io.dart';

// class OpenHelper { 
//   late Database _db;
//   late Completer<Database> _completer;

//   OpenHelper();

//   /// Get the opened database
//   Future<Database> getDatabase() async {
//     if (_completer == null) {
//       _completer = Completer();
//       _openDatabase();
//     }
//     return _completer.future;
//   }

//   Future<Database> _openDatabase() async {

//     _db = await databaseFactoryIo.openDatabase(path);
//     // Mark as opened
//     _completer.complete(_db);
//     return _db;
//   }
// }