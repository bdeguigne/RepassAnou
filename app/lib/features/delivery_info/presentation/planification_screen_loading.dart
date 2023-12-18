import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:repasse_anou/design_system/layouts.dart';
import 'package:repasse_anou/design_system/responsive_utils.dart';
import 'package:repasse_anou/design_system/shimmer_loading.dart';
import 'package:repasse_anou/design_system/theme.dart';
import 'package:repasse_anou/utils/spacing_row_column.dart';

class PlanificationScreenLoading extends StatelessWidget {
  const PlanificationScreenLoading({super.key});

  List<Widget> buildLoadingContent() => [
        SizedBox(
          height: 60.h,
          child: ListView(
            padding: pw(20),
            scrollDirection: Axis.horizontal,
            // list view with count 10 elements
            children: List.generate(
              10,
              (index) => Padding(
                padding: EdgeInsets.only(right: 27.w),
                child: ShimmerLoading(
                  isLoading: true,
                  child: Container(
                    height: 60.h,
                    width: 60.h,
                    decoration: BoxDecoration(
                      borderRadius: br(10),
                      color: AppColors.black,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: pwh(20, 20),
          child: ColumnSpacing(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 10,
            children: [
              ShimmerLoading(
                isLoading: true,
                child: Container(
                  width: double.infinity,
                  height: 60.h,
                  decoration: BoxDecoration(
                    borderRadius: br(15),
                    color: AppColors.black,
                  ),
                ),
              ),
              ShimmerLoading(
                isLoading: true,
                child: Container(
                  width: double.infinity,
                  height: 60.h,
                  decoration: BoxDecoration(
                    borderRadius: br(15),
                    color: AppColors.black,
                  ),
                ),
              ),
              ShimmerLoading(
                isLoading: true,
                child: Container(
                  width: double.infinity,
                  height: 60.h,
                  decoration: BoxDecoration(
                    borderRadius: br(15),
                    color: AppColors.black,
                  ),
                ),
              )
            ],
          ),
        )
      ];

  @override
  Widget build(BuildContext context) {
    return AppLayout.standard(
      appBar: AppAppBar.title('Planification'),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          sh(10),
          Padding(
            padding: pw(20),
            child: const Text('Récupération de votre linge').headlineMedium,
          ),
          sh(15),
          ...buildLoadingContent(),
          sh(10),
          Padding(
            padding: pw(20),
            child: const Text('Livraison de votre linge').headlineMedium,
          ),
          sh(15),
          ...buildLoadingContent(),
          Padding(
            padding: pwh(20, 20),
            child: const ColumnSpacing(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 10,
              children: [],
            ),
          ),
        ],
      ),
    );
  }
}
