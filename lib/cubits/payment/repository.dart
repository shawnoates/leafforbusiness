part of 'cubit.dart';

class PaymentRepository {
  Future<String> checkout(
    num amount,
    String name,
    String email,
    DateTime startDate,
    DateTime endDate,
    Business business,
    String? headline,
    String? locationNotes,
  ) {
    final format = DateFormat('MM/dd/yyyy');
    final formattedStartDate = format.format(startDate).toString();
    final formattedEndDate = format.format(endDate).toString();

    final map = {
      'amount': amount,
      'customer_name': name,
      'customer_email': email,
      'start_date': formattedStartDate,
      'end_date': formattedEndDate,
      'business': business.toMap(),
      'headline': headline,
      'location_notes': locationNotes,
    };

    return PaymentDataProvider.checkout(map);
  }
}
