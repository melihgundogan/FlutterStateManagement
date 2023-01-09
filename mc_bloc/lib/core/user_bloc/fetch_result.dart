part of 'user_bloc.dart';

@immutable
class FetchResult {
  const FetchResult({this.users = const [], this.isCache = false});

  final List<UserModel> users;
  final bool isCache;

  @override
  bool operator ==(covariant FetchResult other) {
    return users.isEqual(other.users) && isCache == other.isCache;
  }

  @override
  int get hashCode => Object.hash(users, isCache);
}
