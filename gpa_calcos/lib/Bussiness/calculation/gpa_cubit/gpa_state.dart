part of 'gpa_cubit.dart';

sealed class GpaState {}

final class GpaInitial extends GpaState {}

final class GpaLoading extends GpaState {}

final class GpaLoaded extends GpaState {
  final double subjects;
  GpaLoaded({required this.subjects});
}

final class GpaError extends GpaState {
  final String message;

  GpaError({required this.message});
}
