/// Created by Balaji Malathi on 9/14/2023 at 10:42 PM.
import 'dart:async';

import './result.dart';

extension FutureEither<L, R> on Future<Result<L, R>> {
  /// Fold [Left] and [Right] into the value of one type
  Future<T> fold<T>(
      FutureOr<T> Function(L left) fnL,
      FutureOr<T> Function(R right) fnR,
      ) {
    return then((either) => either.fold(fnL, fnR));
  }

}
