import 'package:flutter/material.dart';
import 'package:flutter_application_3/core/config/network/dio_settings.dart';
import 'package:flutter_application_3/data/repositories/auth_repository.dart';
import 'package:flutter_application_3/presentation/cubuits/cubit/confirm_code_cubit.dart';
import 'package:flutter_application_3/presentation/screens/registr_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'presentation/cubuits/registr_cubit/registr_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => DioSettings(),
        ),
        RepositoryProvider(
          create: (context) => AuthRepository(
            dio: RepositoryProvider.of<DioSettings>(context).dio,
          ),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => RegistrCubit(
                repository: RepositoryProvider.of<AuthRepository>(context)),
          ),
          BlocProvider(
            create: (context) => ConfirmCodeCubit(
              repository: RepositoryProvider.of<AuthRepository>(context),
            ),
          ),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const RegistrScreen(),
        ),
      ),
    );
  }
}
