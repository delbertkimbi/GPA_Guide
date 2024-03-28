import 'package:flutter_bloc/flutter_bloc.dart';

part 'cgpa_state.dart';

class CgpaCubit extends Cubit<CgpaState> {
  CgpaCubit() : super(CgpaInitial());

  void calculateCgpa(){
    emit(CgpaLoading());
    
  }
}
