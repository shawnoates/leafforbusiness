import 'dart:async';
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leaf_for_business/models/city.dart';

part 'data_provider.dart';
part 'repository.dart';
part 'state.dart';

class CitiesCubit extends Cubit<CitiesState> {
  static CitiesCubit cubit(BuildContext context, [bool listen = false]) =>
      BlocProvider.of<CitiesCubit>(context, listen: listen);

  CitiesCubit() : super(CitiesDefault());

  final repo = _CitiesRepository();

  Future<void> get() async {
    emit(const CitiesFetchLoading());
    try {
      final data = await _CitiesProvider.get();
      final parsed = data.toSet().toList();

      emit(CitiesFetchSuccess(data: parsed));
    } catch (e) {
      emit(CitiesFetchFailed(message: e.toString()));
    }
  }
}
// end-cubit
