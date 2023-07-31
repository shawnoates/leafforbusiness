import 'dart:convert';

import 'package:flutter/foundation.dart';

enum OrderStatus {
  pending,
  success,
  failed,
}

class Order {
  final String orderNumber;
  final num amount;
  final OrderStatus status;
  final String customerEmail;
  final String customerName;
  final String startDate;
  final String endDate;
  Order({
    required this.orderNumber,
    required this.amount,
    required this.status,
    required this.customerEmail,
    required this.customerName,
    required this.startDate,
    required this.endDate,
  });

  Order copyWith({
    String? orderNumber,
    num? amount,
    OrderStatus? status,
    String? customerEmail,
    String? customerName,
    String? startDate,
    String? endDate,
  }) {
    return Order(
      orderNumber: orderNumber ?? this.orderNumber,
      amount: amount ?? this.amount,
      status: status ?? this.status,
      customerEmail: customerEmail ?? this.customerEmail,
      customerName: customerName ?? this.customerName,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'order_number': orderNumber,
      'amount': amount,
      'status': status.name,
      'customer_email': customerEmail,
      'customerName': customerName,
      'start_date': startDate,
      'end_date': endDate,
    };
  }

  factory Order.fromMap(Map<String, dynamic> map) {
    return Order(
      orderNumber: map['order_number'] as String,
      amount: map['amount'] as num,
      status: OrderStatus.values.firstWhere((element) =>
          describeEnum(element) == (map['status'] as String).toLowerCase()),
      customerEmail: map['customer_email'] as String,
      customerName: map['customer_name'] as String,
      startDate: map['start_date'] as String,
      endDate: map['end_date'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Order.fromJson(String source) =>
      Order.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Order(orderNumber: $orderNumber, amount: $amount, status: $status, customerEmail: $customerEmail, customerName: $customerName, startDate: $startDate, endDate: $endDate)';
  }

  @override
  bool operator ==(covariant Order other) {
    if (identical(this, other)) return true;

    return other.orderNumber == orderNumber &&
        other.amount == amount &&
        other.status == status &&
        other.customerEmail == customerEmail &&
        other.customerName == customerName &&
        other.startDate == startDate &&
        other.endDate == endDate;
  }

  @override
  int get hashCode {
    return orderNumber.hashCode ^
        amount.hashCode ^
        status.hashCode ^
        customerEmail.hashCode ^
        customerName.hashCode ^
        startDate.hashCode ^
        endDate.hashCode;
  }
}
