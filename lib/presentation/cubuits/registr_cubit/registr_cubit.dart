import 'package:flutter/material.dart';
import 'package:flutter_application_3/data/repositories/auth_repository.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../models/registr_model.dart';
part 'registr_state.dart';

class RegistrCubit extends Cubit<RegistrState> {
  RegistrCubit({required this.repository}) : super(RegistrInitial());

  Future<void> registr({required RegistrModel model}) async {
    emit(RegistrLoading());
    try {
      String message = await repository.registr(model: model);
      emit(
        RegistrSuccess(
          message: message,
          ),
      );
    } catch (e) {
      emit(RegistrError(
        errorText: e.toString(),
      ));
    }
  }

  final AuthRepository repository;
}
