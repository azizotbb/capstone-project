import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:makfoul_app/repo/layer/auth_layer.dart';
import 'package:makfoul_app/repo/layer/opreations_layer.dart';
import 'package:meta/meta.dart';
import 'package:moyasar/moyasar.dart';

part 'payment_event.dart';
part 'payment_state.dart';

class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  final nameCtrl = TextEditingController();
  final numCtrl = TextEditingController();
  final monthCtrl = TextEditingController();
  final yearCtrl = TextEditingController();
  final cvvCtrl = TextEditingController();
  // Access the operations layer using GetIt (for adding orders)
  final opreationsGet = GetIt.I.get<OpreationsLayer>();

  // Access the authenticated user information
  final authGetit = GetIt.I.get<AuthLayer>();

  PaymentBloc() : super(PaymentInitial()) {
    on<SubmitPaymentEvent>(submitMethod);
  }

  // Handles the event when the payment is marked as "paid"
  FutureOr<void> submitMethod(
    SubmitPaymentEvent event,
    Emitter<PaymentState> emit,
  ) async {
    emit(PaymentLodingState());

    try {
      final paymentConfig = PaymentConfig(
        publishableApiKey: dotenv.env["moyasarKey"].toString(),
        amount: event.amount,
        description: 'order #1324',
        creditCard: CreditCardConfig(saveCard: false, manual: false),
      );

      final source = CardPaymentRequestSource(
        creditCardData: CardFormModel(
          name: event.name,
          number: event.number,
          month: event.month,
          year: event.year,
          cvc: event.cvc,
        ),
        tokenizeCard: false,
        manualPayment: false,
      );

      final result = await Moyasar.pay(
        apiKey: paymentConfig.publishableApiKey,
        paymentRequest: PaymentRequest(paymentConfig, source),
      );

      if (result is PaymentResponse) {
        switch (result.status) {
          case PaymentStatus.paid:
          case PaymentStatus.captured:
          case PaymentStatus.authorized:
            emit(PaymentSuccessState(result.source.transactionUrl));
            break;
          case PaymentStatus.failed:
            emit(PaymentErrorState('فشل في الدفع'));
            break;
          case PaymentStatus.initiated:
            final transactionUrl = result.source.transactionUrl;
            opreationsGet.addOrderMethod(
              uid: authGetit.userinfo.UID,
              courseId: event.courseId,
            );

            emit(PaymentSuccessState(transactionUrl));
            break;
        }
      }
    } catch (e) {
      emit(PaymentErrorState('حدث خطأ: $e'));
    }
  }
}


      // on<PaymentPaidEvent>(paymentPaidMethod);

  // FutureOr<void> paymentPaidMethod(
  //   PaymentPaidEvent event,
  //   Emitter<PaymentState> emit,
  // ) {
  //   opreationsGet.addOrderMethod(
  //     uid: authGetit.userinfo.UID,
  //     courseId: event.courseId,
  //   );
  // }
