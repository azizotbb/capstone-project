import 'package:bloc/bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:meta/meta.dart';
import 'package:moyasar/moyasar.dart';

part 'payment_event.dart';
part 'payment_state.dart';

class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  final paymentConfig = PaymentConfig(
    publishableApiKey: dotenv.env["moyasarKey"].toString(),
    amount: 25758, // SAR 257.58
    description: 'order #1324',
    metadata: {'size': '250g'},
    creditCard: CreditCardConfig(saveCard: false, manual: false),
  );
  PaymentBloc() : super(PaymentInitial()) {
    on<PaymentPaidEvent>((event, emit) {});
  }
}
