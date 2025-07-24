part of 'payment_bloc.dart';

@immutable
sealed class PaymentState {}

final class PaymentInitial extends PaymentState {}
final class PaymentLodingState extends PaymentState {}

final class PaymentSuccessState extends PaymentState {
    final String transactionUrl;

  PaymentSuccessState(this.transactionUrl);

}

final class PaymentErrorState extends PaymentState {
  final String msg;

  PaymentErrorState(this.msg);
}
