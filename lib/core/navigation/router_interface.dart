abstract class RouterInterface {
  Future<void>? pushTo(String path, {Object data});

  Future<void>? pushAndReplace(String path, {Object data});

  Future<void>? popAndReplace(String path, {Object data});

  Future<void> pushAndClear(String path, {Object data});
}
