import 'package:expense_tracker/injector.dart';
import 'package:expense_tracker/src/application/auth_status/cubit/auth_status_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final globalBloc = <BlocProvider>[
  BlocProvider<AuthStatusCubit>(create: (_) => getIt<AuthStatusCubit>()),
];
