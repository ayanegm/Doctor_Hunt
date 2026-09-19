import 'dart:io';

import 'package:dashed_border/dashed_border.dart';
import 'package:doctor_hunt/core/utils/color.dart';
import 'package:doctor_hunt/core/utils/text_styles.dart';
import 'package:doctor_hunt/features/admin/data/repo/admin_repository.dart';
import 'package:doctor_hunt/features/admin/data/service/admin_service.dart';
import 'package:doctor_hunt/features/admin/presentation/controllers/cubit/admin_cubit.dart';
import 'package:doctor_hunt/features/admin/presentation/widgets/doctor_input_field_container.dart';
import 'package:doctor_hunt/features/onboarding/widgets/get_started_button.dart';
import 'package:doctor_hunt/widgets/admin_custom_scaffold.dart';
import 'package:doctor_hunt/widgets/custom_text_field.dart';
import 'package:doctor_hunt/widgets/department_title_widget.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class CreateDoctorScreen extends StatefulWidget {
  const CreateDoctorScreen({super.key});

  @override
  State<CreateDoctorScreen> createState() => _CreateDoctorScreenState();
}

class _CreateDoctorScreenState extends State<CreateDoctorScreen> {
  final TextEditingController doctorName = TextEditingController();
  final List<String> availableSpecialties = [
    'Cardiology',
    'Orthopedic',
    'Dentist',
    'Neurology',
  ];
  late String selectedSpecialty;
  File? _selectedImage;
  Future<void> _pickImage() async {
    try {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        setState(() {
          _selectedImage = File(pickedFile.path);
        });
      }
    } catch (e) {
      print('Error picking image: $e');
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Failed to pick image: $e')));
    }
  }

  @override
  void initState() {
    super.initState();
    selectedSpecialty = availableSpecialties.first;
  }

  @override
  void dispose() {
    doctorName.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          DoctorCubit(AdminRepository(adminService: AdminService())),
      child: AdminCustomScaffold(
        body: BlocConsumer<DoctorCubit, AdminState>(
          listener: (context, state) {
            if (state is AdminSuccessState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Doctor created successfully')),
              );
            } else if (state is AdminFailureState) {
              SnackBar(content: Text(state.errorMessage));
            }
          },
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: GestureDetector(
                    onTap: _pickImage,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      height: 96.h,
                      width: 96.w,
                      child: ClipOval(
                        child: _selectedImage != null
                            ? Image.file(
                                _selectedImage!,
                                fit: BoxFit.cover,
                                height: 96.h,
                                width: 96.w,
                              )
                            : Center(
                                child: Icon(
                                  Icons.camera_alt_outlined,
                                  color: AppColor.grey,
                                  size: 24,
                                ),
                              ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
                Center(
                  child: Text(
                    'edit photo',
                    style: TextStyle(
                      color: AppColor.green,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(height: 16.h),
                SizedBox(height: 20),
                DepartmentTitleWidget(hintText: 'Doctor Name'),
                SizedBox(height: 2.h),

                CustomTextField(
                  controller: doctorName,
                  isPassword: false,
                  hintText: 'e.g. Dr.Ahmed Ali',
                ),
                SizedBox(height: 20),
                DepartmentTitleWidget(hintText: 'Medical Speciality'),
                SizedBox(height: 2.h),
                DoctorInputFieldContainer(
                  leadingIcon: Icon(
                    Icons.medical_services_outlined,
                    color: Colors.grey,
                  ),
                  child: DropdownButtonFormField<String>(
                    initialValue: selectedSpecialty,

                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.zero,
                    ),
                    icon: Icon(
                      Icons.keyboard_arrow_down,
                      color: AppColor.blue,
                      size: 26.r,
                    ),
                    style: TextStyles.textFieldValue,
                    items: availableSpecialties.map((String specialty) {
                      return DropdownMenuItem<String>(
                        value: specialty,
                        child: Text(specialty),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      if (newValue != null) {
                        setState(() {
                          selectedSpecialty = newValue;
                        });
                      }
                    },
                  ),
                ),

                SizedBox(height: 44.h),
                state is AdminLoadingState
                    ? const Center(
                        child: CircularProgressIndicator(color: AppColor.green),
                      )
                    : GetStartedButton(
                        onTap: () {
                          context.read<DoctorCubit>().createNewDoctor(
                            name: doctorName.text,
                            speciality: selectedSpecialty,
                            imageFile: _selectedImage,
                          );
                        },
                        title: 'Create Doctor',
                      ),
              ],
            );
          },
        ),
      ),
    );
  }
}
