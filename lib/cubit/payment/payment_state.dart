part of 'payment_cubit.dart';

@immutable
sealed class PaymentState {}

final class PaymentInitial extends PaymentState {}
final class PaymentLoading extends PaymentState {}
final class PaymentSuccessfully extends PaymentState {}
final class PaymentNoInernt extends PaymentState {}
final class PaymentWrongCode extends PaymentState {}
final class PaymentNoRowEffect extends PaymentState {}
final class PaymentFaulier extends PaymentState {

    final String errMessage;

  PaymentFaulier({required this.errMessage});
    
}
