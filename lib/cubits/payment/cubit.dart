import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';
import 'package:leaf_for_business/models/business.dart';

import 'package:leaf_for_business/services/api.dart';
import 'package:leaf_for_business/services/app_env.dart';

part 'data_provider.dart';
part 'repository.dart';
part 'state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  static PaymentCubit c(BuildContext context, [bool listen = false]) =>
      BlocProvider.of<PaymentCubit>(context, listen: listen);

  PaymentCubit() : super(const PaymentStateDefault());

  final repo = PaymentRepository();

  Future<void> checkout(
    num amount,
    String name,
    String email,
    DateTime startDate,
    DateTime endDate,
    Business business,
    String? headline,
    String? locationNotes,
  ) async {
    emit(state.copyWith(
      checkout: const CheckoutLoading(),
    ));
    try {
      final url = await repo.checkout(
        amount,
        name,
        email,
        startDate,
        endDate,
        business,
        headline,
        locationNotes,
      );
      emit(state.copyWith(
        checkout: CheckoutSuccess(url: url),
      ));
      emit(state.copyWith(
        checkout: CheckoutDefault(),
      ));
    } catch (e) {
      emit(state.copyWith(
        checkout: CheckoutFailed(message: e.toString()),
      ));
    }
  }
}
// end-cubit
