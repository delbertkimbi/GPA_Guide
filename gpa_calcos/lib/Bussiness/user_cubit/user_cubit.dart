import 'package:flutter_bloc/flutter_bloc.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(const UserState(userName: '', userEmail: ''));

  void updateUserName(String name) => emit(UserState(userName: name, userEmail: state.userEmail));
  void updateUserEmail(String email) => emit(UserState(userName: state.userName, userEmail: email));
}

class UserState {
  final String userName;
  final String userEmail;

  const UserState({required this.userName, required this.userEmail});
}


/// Read the stored data elsewhere
// context.read<UserCubit>().state.userName 
// context.read<UserCubit>().state.userEmail.