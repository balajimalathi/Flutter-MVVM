import 'package:buildbase/core/extensions/string_extension.dart';
import 'package:buildbase/core/helpers/result.dart';

import '../../core/network/network_exception.dart';
import '../../core/network/network_manager.dart';
import '../../locator.dart';

/// Created by Balaji Malathi on 22-03-2023 at 15:28.
class ExampleRepositoryImpl extends ExampleRepository with ApiBaseHelper {
  final NetworkManager _api = locator<NetworkManager>();

  @override
  Future<Result<String, String>> moveForward(int meters) {
    // TODO: implement moveForward
    throw UnimplementedError();
  }


}

abstract class ExampleRepository {

  Future<Result<String, String>> moveForward(int meters);
}
