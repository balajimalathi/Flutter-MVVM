import '../../locator.dart';
import '../../core/network/network_exception.dart';
import '../../core/network/network_manager.dart';

/// Created by Balaji Malathi on 22-03-2023 at 15:28.
class ExampleService extends IExampleService with ApiBaseHelper{
  final NetworkManager _api = locator<NetworkManager>();
}

abstract class IExampleService {
}
