part of 'report_cubit.dart';

@immutable
sealed class ReportState {}

final class ReportInitial extends ReportState {}
final class ReportReading extends ReportState {}
final class ReportPayment extends ReportState {}
final class ReportReadingAndPayment extends ReportState {}
final class ReportNoEnternt extends ReportState {}
final class ReportWrongDate extends ReportState {}
final class ReportNoDateChooes extends ReportState {}
final class ReportNoDataReading extends ReportState {}
final class ReportNoDataPayment extends ReportState {}





