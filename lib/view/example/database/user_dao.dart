import 'dart:async';

import 'package:buildbase/core/base/locator.dart';
import 'package:buildbase/product/utils/db_constants.dart';
import 'package:buildbase/view/example/bottom_nav/model/user_model.dart';
import 'package:sembast/sembast.dart';

/// All the crud functionality of the User Data will be placed here
/// Try to collect and update the database *PLEASE DO NOT SAVE DATA IN MULTIPLE STORE - WE CAN'T USE JOINS (I don't know yet*)*
class UserDao {
  final _userStore = intMapStoreFactory.store(DBConstants.USER);

  Database get __db => locator<Database>();

  Future insert(Datum user) async {
    await _userStore.record(user.id).put(__db, user.toMap());
  }

  Future update(Datum user) async {
    final finder = Finder(filter: Filter.byKey(user.id));
    await _userStore.update(
      __db,
      user.toMap(),
      finder: finder,
    );
  }

  Future delete(int id) async {
    final finder = Finder(filter: Filter.byKey(id));
    await _userStore.delete(
      __db,
      finder: finder,
    );
  }

  Future<void> deleteAll() async {
    await _userStore.drop(__db).then((value) => print(value));
  }

  Future<List<Datum>> getAllSortedByName() async {
    // Finder object can also sort data.
    final finder = Finder(sortOrders: [
      SortOrder('first_name'),
    ]);

    final recordSnapshots = await _userStore.find(
      __db,
      finder: finder,
    );

    // Making a List<Datum> out of List<RecordSnapshot>
    return recordSnapshots.map((snapshot) {
      final user = Datum.fromMap(snapshot.value);
      // An ID is a key of a record from the database.
      user.id = snapshot.key;
      return user;
    }).toList();
  }

  ///
  /// Stream function of async update on the UI - Store
  ///

  /// Place these transformer in a seperate place..
  ///
  /// HOW IT WORKS:
  /// 1. It collect the data from the stream where the data will be Recordchange snapshot.
  /// 2. Then convert the Recordchange data in to modal class
  /// 3. Sink to the stream

  var notesTransformer = StreamTransformer<
      List<RecordSnapshot<int, Map<String, Object?>>>,
      List<Datum>>.fromHandlers(handleData: (snapshotList, sink) {
    sink.add(DbNotes(snapshotList));
  });

  Stream<List<Datum>> onNotes() {
    /// Use finder for querying
    var subscription = _userStore
        .query(finder: Finder())
        .onSnapshots(__db)
        .transform(notesTransformer)
        .asBroadcastStream();
    return subscription;
  }

  /// List for changes in the Record
  var noteTransformer = StreamTransformer<
      RecordSnapshot<int, Map<String, Object?>>?,
      Datum?>.fromHandlers(handleData: (snapshot, sink) {
    sink.add(snapshot == null ? null : snapshotToNote(snapshot));
  });

  /// Listed for changes on a given note
  Stream<Datum?> onNote(int id) {
    return _userStore.record(id).onSnapshot(__db).transform(noteTransformer);
  } 
}
