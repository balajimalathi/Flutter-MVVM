/// Created by Balaji Malathi on 9/14/2023 at 10:39 PM.
import 'dart:async';

typedef Lazy<T> = T Function();


/// Represents a value of one of two possible types.
/// Instances of [Result] are either an instance of [Left] or [Right].
///
/// [Left] is used for "failure".
/// [Right] is used for "success".
sealed class Result<L, R> {
  const Result();

  /// Transform values of [Left] and [Right]
  Result<TL, TR> either<TL, TR>(
      TL Function(L left) fnL, TR Function(R right) fnR);

  /// Fold [Left] and [Right] into the value of one type
  T fold<T>(T Function(L left) fnL, T Function(R right) fnR);
}
