part of 'user_bloc.dart';

@immutable
abstract class LoadAction {
  const LoadAction();
}

class LoadPersonAction extends LoadAction {
  final UserUrl url;
  final PersonLoader onLoader;

  LoadPersonAction( {required this.onLoader, required this.url});
}
