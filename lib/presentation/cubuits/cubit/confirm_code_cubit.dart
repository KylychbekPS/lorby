import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repositories/auth_repository.dart';
part 'confirm_code_state.dart';

class ConfirmCodeCubit extends Cubit<ConfirmCodeState> {
  ConfirmCodeCubit({required this.repository}) : super(ConfirmCodeInitial());


  Future<void> sendCode({required String code}) async {
    emit(ConfirmCodeLoading());
    try {
      String message = await repository.confirmCode(code: code);
      emit(
        ConfirmCodeSuccess(
          message: message,
          ),
      );
    } catch (e) {
      emit(ConfirmCodeError(
        errorText: e.toString(),
      ));
    }
  }

  final AuthRepository repository;
}
