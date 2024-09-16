import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:doctors_app/core/helpers/spacing.dart';
import 'package:doctors_app/core/theming/app_style.dart';
import 'package:doctors_app/core/utils/app_constants.dart';
import 'package:doctors_app/core/utils/widgets/custom_failure_widget.dart';
import 'package:doctors_app/core/utils/widgets/custom_loading_widget.dart';
import 'package:doctors_app/features/home/presentation/widgets/doctor_item.dart';
import 'package:doctors_app/features/search/presentation/logic/search_cubit/search_cubit.dart';

class SearchResults extends StatelessWidget {
  const SearchResults({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is SearchSuccess) {
          return Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('${state.doctorList.length} Founds',
                    style: AppStyle.styleSemiBold16),
                verticalSpace(16),
                Expanded(
                  child: state.doctorList.isEmpty
                      ? const CustomFailureWidget(
                          errMessage: 'No Doctors Founds')
                      : ListView.builder(
                          itemCount: state.doctorList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: EdgeInsets.only(bottom: 16.h),
                              child: DoctorItem(
                                doctor: state.doctorList[index],
                                index: (index % doctorsImages.length) + 1,
                              ),
                            );
                          },
                        ),
                ),
              ],
            ),
          );
        } else if (state is SearchFailure) {
          return CustomFailureWidget(errMessage: state.errMessage);
        } else if (state is SearchLoading) {
          return const CustomLoadingWidget();
        }
        return const SizedBox.shrink();
      },
    );
  }
}
