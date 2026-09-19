import 'package:doctor_hunt/core/utils/color.dart';
import 'package:doctor_hunt/features/admin/data/repo/admin_repository.dart';
import 'package:doctor_hunt/features/admin/data/service/admin_service.dart';
import 'package:doctor_hunt/features/doctors/presentation/cubit/doctors_cubit.dart';
import 'package:doctor_hunt/features/doctors/presentation/cubit/doctors_state.dart';
import 'package:doctor_hunt/widgets/custom_scaffold.dart';
import 'package:doctor_hunt/core/models/user_model.dart';
import 'package:doctor_hunt/features/home/data/models/category_model.dart';
import 'package:doctor_hunt/features/home/presentation/widgets/category_card.dart';
import 'package:doctor_hunt/widgets/department_title_widget.dart';
import 'package:doctor_hunt/features/home/presentation/widgets/doctor_card_widget.dart';
import 'package:doctor_hunt/features/home/presentation/widgets/feature_doctor_card.dart';
import 'package:doctor_hunt/features/home/presentation/widgets/live_doctor_video_widget.dart';
import 'package:doctor_hunt/widgets/search_bar_widget.dart';
import 'package:doctor_hunt/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, this.userModel});
  final UserModel? userModel;
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int _currentIndex = 0;
  final List<CategoryModel> categoriesList = [
    CategoryModel(color: const Color(0xFF0EBE7F), iconData: Icons.visibility),
    CategoryModel(color: const Color(0xFF0066FF), iconData: Icons.visibility),
    CategoryModel(color: const Color(0xFFFF9900), iconData: Icons.visibility),
    CategoryModel(color: const Color(0xFFFF9900), iconData: Icons.visibility),
  ];

  @override
  Widget build(BuildContext context) {
    final TextEditingController searchText = TextEditingController();
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return BlocProvider(
      create: (context) =>
          DoctorsCubit(AdminRepository(adminService: AdminService()))
            ..getAllDoctors(),
      child: CustomScaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Image.asset(
                    Assets.homeBackgroundRectangle,
                    height: 0.19 * screenHeight,
                    width: screenWidth,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    top: screenHeight * 0.044,
                    left: screenWidth * 0.051,
                    right: screenWidth * 0.053,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: screenHeight * 0.014),
                            Text(
                              'Hi ${widget.userModel!.name}!',
                              style: TextStyle(
                                color: AppColor.white,
                                fontWeight: FontWeight.w400,
                                fontSize: screenWidth * 0.053,
                              ),
                            ),
                            SizedBox(height: screenHeight * 0.007),
                            Text(
                              'Find Your Doctor',
                              style: TextStyle(
                                color: AppColor.white,
                                fontWeight: FontWeight.w700,
                                fontSize: screenWidth * 0.067,
                              ),
                            ),
                          ],
                        ),
                        Image.asset(
                          Assets.HomecircleImage,
                          height: screenHeight * 0.073,
                          width: screenWidth * 0.16,
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 0.15 * screenHeight,
                    left: 0.053 * screenWidth,
                    right: screenWidth * 0.053,
                    child: SearchTextField(
                      hintText: 'Search.....',
                      controller: searchText,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 0.04 * screenHeight),

              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(
                      screenWidth * 0.05,
                      0,
                      screenWidth * 0.05,
                      screenHeight * 0.12,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        DepartmentTitleWidget(hintText: 'Live Doctors'),
                        SizedBox(height: 0.003 * screenHeight),
                        LiveDoctorVideoWidget(),
                        SizedBox(height: 0.016 * screenHeight),

                        SizedBox(
                          height: 0.100 * screenHeight,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.only(
                                  right: screenWidth * 0.04,
                                ),
                                child: CategoryCard(
                                  categoryModel: categoriesList[index],
                                ),
                              );
                            },
                            itemCount: categoriesList.length,
                          ),
                        ),
                        SizedBox(height: 0.016 * screenHeight),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            DepartmentTitleWidget(hintText: 'Popular Doctor'),
                            Text('See all'),
                          ],
                        ),
                        SizedBox(height: 0.003 * screenHeight),

                        SizedBox(
                          height: screenHeight * 0.29,
                          child: BlocBuilder<DoctorsCubit, DoctorsState>(
                            builder: (context, state) {
                              if (state is DcotorLoading) {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              } else if (state is DoctorSuccess) {
                                final doctors = state.doctorsList;

                                if (doctors.isEmpty) {
                                  return const Center(
                                    child: Text('No doctors available'),
                                  );
                                }

                                return ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: doctors.length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: EdgeInsets.only(
                                        right: screenWidth * 0.04,
                                      ),
                                      child: DoctorCardWidget(
                                        doctorModel: doctors[index],
                                      ),
                                    );
                                  },
                                );
                              } else if (state is DoctorFailure) {
                                return Center(child: Text(state.errorMessage));
                              }
                              return const SizedBox.shrink();
                            },
                          ),
                        ),
                        SizedBox(height: 0.003 * screenHeight),

                        SizedBox(
                          height: screenHeight * 0.22,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.only(
                                  right: screenWidth * 0.04,
                                ),
                                child: const FeatureDoctorCard(),
                              );
                            },
                            itemCount: 4,
                          ),
                        ),
                        SizedBox(height: 0.024 * screenHeight),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
