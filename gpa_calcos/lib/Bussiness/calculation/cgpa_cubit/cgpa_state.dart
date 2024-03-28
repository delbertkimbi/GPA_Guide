part of 'cgpa_cubit.dart';

sealed class CgpaState {}

final class CgpaInitial extends CgpaState {}

final class CgpaError extends CgpaState {
  final String Err;

  CgpaError({required this.Err});
}

final class CgpaLoading extends CgpaState {}

final class CgpaLoaded extends CgpaState {

}
