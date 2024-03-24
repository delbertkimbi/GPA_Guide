import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'cgpa_state.dart';

class CgpaCubit extends Cubit<CgpaState> {
  CgpaCubit() : super(CgpaInitial());
}
