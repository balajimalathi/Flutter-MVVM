import 'package:buildbase/core/init/database/db_provider.dart';
import 'package:buildbase/product/utils/db_constants.dart';
import 'package:buildbase/view/example/bottom_nav/model/user_model.dart';
import 'package:sembast/sembast.dart';

class UserDao {
  // A Store with int keys and Map<String, dynamic> values.
  // This Store acts like a persistent map, values of which are User objects converted to Map
  final _userStore = intMapStoreFactory.store(DBConstants.USER);

  // Private getter to shorten the amount of code needed to get the
  // singleton instance of an opened database.
  Future<Database> get _db async => await AppDatabase.instance.database;

  Future insert(Datum user) async {
    // await _userStore.add(await _db, user.toMap());
    await _userStore.record(user.id).put(await _db, user.toMap());
  }

  Future update(Datum user) async {
    // For filtering by key (ID), RegEx, greater than, and many other criteria,
    // we use a Finder.
    final finder = Finder(filter: Filter.byKey(user.id));
    await _userStore.update(
      await _db,
      user.toMap(),
      finder: finder,
    );
  }

  Future delete(int id) async {
    final finder = Finder(filter: Filter.byKey(id));
    await _userStore.delete(
      await _db,
      finder: finder,
    );
  }

  Future<void> deleteAll() async {
    await _userStore.drop(await _db).then((value) => print(value));
  }

  Future<List<Datum>> getAllSortedByName() async {
    // Finder object can also sort data.
    final finder = Finder(sortOrders: [
      SortOrder('first_name'),
    ]);

    final recordSnapshots = await _userStore.find(
      await _db,
      finder: finder,
    );

    // Making a List<User> out of List<RecordSnapshot>
    return recordSnapshots.map((snapshot) {
      final user = Datum.fromMap(snapshot.value);
      // An ID is a key of a record from the database.
      user.id = snapshot.key;
      return user;
    }).toList();
  }

  Future<Stream> asyncFunction() async {
    var data = _userStore.stream(await _db);
    return data;
    // _userStore.addOnChangesListener(await _db, (transaction, changes) async {
    //   // For each student deleted, delete the entry in enroll store
    //   for (var change in changes) {
    //     print(change);
    //     // // newValue is null for deletion
    //     // if (change.isDelete) {
    //     //   // Delete in enroll, use the transaction!
    //     //   await enrollStore.delete(transaction,
    //     //       finder:
    //     //           Finder(filter: Filter.equals('student', change.ref.key)));
    //     // }
    //   }
    //   return changes;
    // });
  }
}
