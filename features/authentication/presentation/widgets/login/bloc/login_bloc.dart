import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:pfechotranasmartvillage/features/authentication/domain/model/auth_user.dart';
import '../../../../domain/usecases/login_user_usecase.dart';
part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginUserUseCase loginUserUseCase ;
  LoginBloc(this.loginUserUseCase) : super(LoginInitial()) {
    on<SubmitUserEvent>((event, emit) async {
      try {
        debugPrint('Login Executed');
        final user = await loginUserUseCase.call(event.authUser);
        debugPrint('User Submitted  is $user');
        if(user){
          emit(LoginSuccessState("Login with success"));
        }else{
          emit(LoginErrorState("Failed to login"));
        }
      } catch (e) {
        debugPrint('Exception : $e');
      }
    });
  }
}
