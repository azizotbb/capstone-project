import 'package:get_it/get_it.dart';
import 'package:makfoul_app/repo/layer/auth_layer.dart';

void setup() {
  GetIt.I.registerSingleton<AuthLayer>(AuthLayer());
}
