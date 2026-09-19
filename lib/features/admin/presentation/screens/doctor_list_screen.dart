import 'package:doctor_hunt/core/utils/color.dart';
import 'package:doctor_hunt/features/admin/data/repo/admin_repository.dart';
import 'package:doctor_hunt/features/admin/data/service/admin_service.dart';
import 'package:doctor_hunt/features/admin/presentation/controllers/cubit/admin_cubit.dart';
import 'package:doctor_hunt/features/admin/presentation/widgets/doctor_container.dart';
import 'package:doctor_hunt/features/admin/presentation/widgets/floating_action_button.dart';
import 'package:doctor_hunt/features/admin/presentation/widgets/horizotanl_filter_row.dart';
import 'package:doctor_hunt/features/admin/presentation/widgets/statistics_container.dart';
import 'package:doctor_hunt/features/doctors/presentation/cubit/doctors_cubit.dart';
import 'package:doctor_hunt/features/doctors/presentation/cubit/doctors_state.dart';
import 'package:doctor_hunt/widgets/admin_custom_scaffold.dart';
import 'package:doctor_hunt/widgets/search_bar_widget.dart';
import 'package:doctor_hunt/widgets/custom_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class DoctorListPage extends StatelessWidget {
  DoctorListPage({super.key});
  final TextEditingController searchText = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final TextEditingController searchText = TextEditingController();
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return BlocProvider(
      create: (context) =>
          DoctorsCubit(AdminRepository(adminService: AdminService()))
            ..getAllDoctors(),
      child: AdminCustomScaffold(
        body: Stack(
          children: [
            BlocBuilder<DoctorsCubit, DoctorsState>(
              builder: (context, state) {
                int totalDoctorsCount = 0;
                if (state is DoctorSuccess) {
                  totalDoctorsCount = state.doctorsList.length;
                }
                return Column(
                  children: [
                    Row(
                      children: [
                        StatisticsContainer(
                          title: 'Active Doctors',
                          value: totalDoctorsCount,
                        ),
                        SizedBox(width: 12.w),
                        StatisticsContainer(
                          title: 'Total Doctors',
                          value: totalDoctorsCount,
                        ),
                      ],
                    ),

                    SizedBox(height: 8.h),
                    SearchTextField(
                      controller: searchText,
                      hintText: 'Search doctors...',
                    ),
                    SizedBox(height: 14.h),

                    HorizontalFilterChips(),
                    SizedBox(height: 14.h),
                    SizedBox(
                      height: 0.50 * screenHeight,
                      child: BlocBuilder<DoctorsCubit, DoctorsState>(
                        builder: (context, state) {
                          if (state is AdminLoadingState) {
                            return Center(child: CircularProgressIndicator());
                          } else if (state is DoctorSuccess) {
                            final doctors = state.doctorsList;
                            if (doctors.isEmpty) {
                              return Center(child: Text('No doctors found'));
                            }

                            return ListView.builder(
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: EdgeInsetsGeometry.only(
                                    bottom: 12.h,
                                  ),
                                  child: GestureDetector(
                                    onTap: () async {
                                      await context.push(
                                        '/EditDoctorScreen',
                                        extra: doctors[index],
                                      );
                                      if (context.mounted) {
                                        context
                                            .read<DoctorsCubit>()
                                            .getAllDoctors();
                                      }
                                    },
                                    child: DoctorContainer(
                                      doctorModel: doctors[index],
                                    ),
                                  ),
                                );
                              },
                              itemCount: doctors.length,
                            );
                          } else if (state is DoctorFailure) {
                            return Center(child: Text(state.errorMessage));
                          }
                          return SizedBox();
                        },
                      ),
                    ),
                  ],
                );
              },
            ),
            Positioned(
              bottom: 12,
              right: 0,
              child: FloatingButton(
                onTap: () {
                  context.push('/CreateDoctorScreen');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
