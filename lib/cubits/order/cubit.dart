import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:leaf_for_business/models/order.dart' as order;

part 'data_provider.dart';
part 'repository.dart';
part 'state.dart';

class OrderCubit extends Cubit<OrderState> {
  static OrderCubit c(BuildContext context, [bool listen = false]) =>
      BlocProvider.of<OrderCubit>(context, listen: listen);
  OrderCubit() : super(const OrderStateDefault());

  final repo = _OrderRepository();

  Future<void> fetch(String id) async {
    emit(state.copyWith(
      fetch: OrderFetchLoading(),
    ));
    try {
      final data = await repo.fetch(id);
      emit(state.copyWith(
        fetch: OrderFetchSuccess(data: data),
      ));
    } catch (e) {
      emit(state.copyWith(
        fetch: OrderFetchFailed(message: e.toString()),
      ));
    }
  }
}
