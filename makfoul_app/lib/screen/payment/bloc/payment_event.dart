part of 'payment_bloc.dart';

@immutable
sealed class PaymentEvent {}

class PaymentPaidEvent extends PaymentEvent {
  final int courseId;

  PaymentPaidEvent({required this.courseId});
}
