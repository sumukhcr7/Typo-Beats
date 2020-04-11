import 'package:meta/meta.dart';

@immutable
class AppState {

  AppState();

  factory AppState.initial() {
    return AppState();
  }

  AppState copyWith() {
    return AppState();
  }

//   @override
//   bool operator ==(Object other) =>
//       identical(this, other) ||
//           other is AppState &&
//               runtimeType == other.runtimeType &&
//               discussionState == other.discussionState&&
//               user == other.user;

//   @override
//   int get hashCode =>
//       discussionState.hashCode ^
//       user.hashCode;
}
