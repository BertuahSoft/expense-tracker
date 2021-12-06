import 'package:expense_tracker/injector.dart';
import 'package:expense_tracker/src/application/core/auth_status/cubit/auth_status_cubit.dart';
import 'package:expense_tracker/src/application/core/flash/cubit/flash_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final globalBloc = <BlocProvider>[
  BlocProvider<AuthStatusCubit>(
      create: (_) => getIt<AuthStatusCubit>()..getAuthenticatedUser()),
  BlocProvider<FlashCubit>(create: (_) => getIt<FlashCubit>()),
];
