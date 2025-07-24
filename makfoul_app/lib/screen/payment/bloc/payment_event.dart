part of 'payment_bloc.dart';

@immutable
sealed class PaymentEvent {}

class SubmitPaymentEvent extends PaymentEvent {
  final String name, number, month, year, cvc;
  final int amount;
    final int courseId;


  SubmitPaymentEvent(this.name, this.number, this.month, this.year, this.cvc, this.amount, {required this.courseId});
}


// class PaymentPaidEvent extends PaymentEvent {
//   final int courseId;

//   PaymentPaidEvent({required this.courseId});
// }