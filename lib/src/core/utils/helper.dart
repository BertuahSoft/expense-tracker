import 'package:flutter_config/flutter_config.dart';

bool isProduction = FlutterConfig.get('ENV').toString() == 'production';
