import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do/app/app.dart';
import 'package:to_do/data/service/get_it/get_it.dart';
import 'package:to_do/data/service/notification_service/local_notification_service.dart';

import 'app/bloc_observer.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  LocalNotificationService.localNotificationService.init(navigatorKey);
  setup();
  Bloc.observer = AppBlocObserver();
  runApp(const App());
}
