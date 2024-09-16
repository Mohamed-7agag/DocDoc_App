import 'package:doctors_app/features/home/data/models/specialiazation_model/doctor.dart';
import 'package:doctors_app/features/search/data/repos/search_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.searchRepo) : super(SearchInitial());
  final SearchRepo searchRepo;
  final TextEditingController searchController = TextEditingController();
  Future<void> getSearchedDoctors() async {
    emit(SearchLoading());
    final result = await searchRepo.getSearchedList(doctorName: searchController.text);
    result.fold(
      (failure) => emit(SearchFailure(failure.errMessage)),
      (doctorList) => emit(SearchSuccess(doctorList)),
    );
  }
}
