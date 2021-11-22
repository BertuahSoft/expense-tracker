import 'package:flutter_bloc/flutter_bloc.dart';

class ExpenseBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    print('onCreate --${bloc.runtimeType}');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    print('onChange --${bloc.runtimeType}');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace trace) {
    print('onError --${bloc.runtimeType}, $error');
    super.onError(bloc, error, trace);
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    print('onClose --${bloc.runtimeType}');
  }
}
