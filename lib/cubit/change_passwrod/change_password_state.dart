part of 'change_password_cubit.dart';

@immutable
sealed class ChangePasswordState {}

final class ChangePasswordInitial extends ChangePasswordState {}
final class ChangePasswordNoteEqual  extends ChangePasswordState {}
final class ChangePasswordWrongPassword extends ChangePasswordState {}
final class ChangePasswordLoading extends ChangePasswordState {}
final class ChangePasswordSuccess extends ChangePasswordState {}
final class ChangePasswordNoInternt extends ChangePasswordState {}
final class ChangePasswordFailur extends ChangePasswordState {
  final String errMessage;

  ChangePasswordFailur({required this.errMessage});
}

