part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}
final class LoginLoading extends LoginState {}
final class LoginSuccess extends LoginState {}
final class LoginFalure extends LoginState {

  final String errMessage;

  LoginFalure({required this.errMessage});
   
}
final class LoginWrongPasswordAndPhone extends LoginState {}
final class LoginNOinternt extends LoginState {}
