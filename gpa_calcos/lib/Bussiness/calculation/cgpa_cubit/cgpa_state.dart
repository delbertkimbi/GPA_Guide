part of 'cgpa_cubit.dart';

sealed class CgpaState {}

final class CgpaInitial extends CgpaState {}

final class CgpaError extends CgpaState {
  final String err;

  CgpaError({required this.err});
}

final class CgpaLoading extends CgpaState {}

final class CgpaLoaded extends CgpaState {}
