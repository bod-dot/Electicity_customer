part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}
final class HomeLoading extends HomeState {}
final class HomeSuccess extends HomeState {}
final class HomeFaluir extends HomeState {
final String errMessage;

  HomeFaluir({required this.errMessage});


}

final class HomeNoInternt extends HomeState {}
final class HomeNoData extends HomeState {}
