import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

import 'bloc_observer.dart';
import 'portfolio_app.dart';

void main() {
  usePathUrlStrategy();
  Bloc.observer = MyBlocObserver();
  runApp(const PortfolioApp());
}
