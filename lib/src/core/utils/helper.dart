import 'package:expense_tracker/generated/l10n.dart';
import 'package:expense_tracker/injector.dart';
import 'package:flutter_config/flutter_config.dart';

bool isProduction = FlutterConfig.get('ENV').toString() == 'production';
S get i10n => getIt<S>();
