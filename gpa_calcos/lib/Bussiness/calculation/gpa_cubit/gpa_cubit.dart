import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'gpa_state.dart';

class GpaCubit extends Cubit<GpaState> {
  GpaCubit() : super(GpaInitial());
}
