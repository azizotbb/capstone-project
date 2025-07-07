import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:makfoul_app/repo/layer/auth_layer.dart';
import 'package:makfoul_app/repo/layer/opreations_layer.dart';
import 'package:meta/meta.dart';
import 'package:moyasar/moyasar.dart';

part 'payment_event.dart';
part 'payment_state.dart';

class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  // Access the operations layer using GetIt (for adding orders)
  final opreationsGet = GetIt.I.get<OpreationsLayer>();

  // Access the authenticated user information
  final authGetit = GetIt.I.get<AuthLayer>();

  PaymentBloc() : super(PaymentInitial()) {
    on<PaymentPaidEvent>(paymentPaidMethod);
  }

  // Handles the event when the payment is marked as "paid"
  FutureOr<void> paymentPaidMethod(
    PaymentPaidEvent event,
    Emitter<PaymentState> emit,
  ) {
    opreationsGet.addOrderMethod(
      uid: authGetit.userinfo.UID,
      courseId: event.courseId,
    );
  }
}
