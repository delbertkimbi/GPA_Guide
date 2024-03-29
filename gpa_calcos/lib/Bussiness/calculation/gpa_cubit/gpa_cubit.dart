import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gpa_calcos/Data/models/subjects.dart';

part 'gpa_state.dart';

class GpaCubit extends Cubit<GpaState> {
  GpaCubit() : super(GpaInitial());
  void getSubjects(List<Subject> subjects) {}
  void displaySubjecrs() {
    emit(GpaInitial());
  }

  List<Subject> subjects = [];

  TextEditingController subjectNameController = TextEditingController();
  TextEditingController gradeController = TextEditingController();
  TextEditingController creditValueController = TextEditingController();

  void refresh() {
    emit(GpaLoading());
    emit(GpaLoaded(subjects: calculateGPA()));
  }

  String? validate() {
    if (subjectNameController.text.isEmpty) {
      return 'Enter subject name';
    } else if (gradeController.text.isEmpty) {
      return 'Enter subject grade';
    } else if (creditValueController.text.isEmpty) {
      return 'Enter subject credit value';
    } else {
      return null;
    }
  }

  double calculateGPA() {
    double totalCredits = 0;
    double totalGradePoints = 0;

    for (var subject in subjects) {
      totalCredits += subject.creditValue;
      totalGradePoints +=
          _calculateGradePoints(subject.grade) * subject.creditValue;
    }

    if (totalCredits > 0) {
      return totalGradePoints / totalCredits;
    } else {
      return 0.0;
    }
  }

  double _calculateGradePoints(String grade) {
    switch (grade) {
      case 'A':
        return 4.0;
      case 'B+':
        return 3.5;
      case 'B':
        return 3.0;
      case 'C+':
        return 2.5;
      case 'C':
        return 2.0;
      case 'D+':
        return 1.0;
      case 'D':
        return 1.0;
      default:
        return 0.0;
    }
  }

  addSubject() {
    emit(GpaLoading());
    try {
      String? error = validate();
      if (error != null) {
        emit(GpaError(message: error));
      } else {
        Subject subject = Subject(
            name: subjectNameController.text,
            grade: gradeController.text,
            creditValue: double.tryParse(creditValueController.text) ?? 0);
        subjects.add(subject);
        subjectNameController.clear();
        creditValueController.clear();
        gradeController.clear();
        emit(GpaLoaded(subjects: calculateGPA()));
      }
    } catch (e, s) {
      debugPrintStack(stackTrace: s);
      emit(GpaError(message: e.toString()));
    }
  }
}
