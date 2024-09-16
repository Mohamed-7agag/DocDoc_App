import 'package:doctors_app/core/helpers/spacing.dart';
import 'package:doctors_app/core/utils/widgets/custom_app_bar.dart';
import 'package:doctors_app/features/search/presentation/logic/search_cubit/search_cubit.dart';
import 'package:doctors_app/features/search/presentation/widgets/search_results.dart';
import 'package:doctors_app/features/search/presentation/widgets/search_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, "Search"),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            verticalSpace(32),
            SearchTextField(
                controller: context.read<SearchCubit>().searchController),
            verticalSpace(32),
            const SearchResults(),
          ],
        ),
      ),
    );
  }
}
