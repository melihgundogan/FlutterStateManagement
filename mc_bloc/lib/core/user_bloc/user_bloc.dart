import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:mc_bloc/core/extension/app_extension.dart';
import 'package:mc_bloc/core/service/user_service.dart';

import '../model/user_model.dart';


part 'load_action.dart';

part 'fetch_result.dart';

typedef PersonLoader = Future<List<UserModel>> Function(UserUrl);

class UserBloc extends Bloc<LoadAction, FetchResult?> {
  UserBloc() : super(null) {
    on<LoadPersonAction>(_onLoadPerson);
  }

  final Map<UserUrl, Iterable<UserModel>> _cached = {};

  Future<void> _onLoadPerson(
      LoadPersonAction event, Emitter<FetchResult?> emit) async {
    final url = event.url;
    if (_cached.containsKey(url)) {
      final cachedUsers = _cached[url];
      emit(FetchResult(users: cachedUsers!.toList(), isCache: true));
      'Data From Cache'.log();
    } else {
      final personLoader = event.onLoader;
      final userFromService = await personLoader(url);
      _cached[url] = userFromService;
      emit(FetchResult(users: userFromService, isCache: false));
      'Data From Service'.log();
    }
  }
}


