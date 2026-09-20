import 'dart:io';
import 'package:doctor_hunt/core/services/cloudinary_service.dart';
import 'package:doctor_hunt/core/utils/color.dart';
import 'package:doctor_hunt/core/utils/text_styles.dart';
import 'package:doctor_hunt/features/admin/data/repo/admin_repository.dart';
import 'package:doctor_hunt/features/admin/data/service/admin_service.dart';
import 'package:doctor_hunt/features/admin/presentation/controllers/cubit/admin_cubit.dart';
import 'package:doctor_hunt/features/admin/presentation/widgets/clicked_text_widget.dart';
import 'package:doctor_hunt/features/admin/presentation/widgets/doctor_input_field_container.dart';
import 'package:doctor_hunt/features/common/onboarding/widgets/get_started_button.dart';
import 'package:doctor_hunt/features/doctors/data/models/doctor_model.dart';
import 'package:doctor_hunt/widgets/admin_custom_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

class EditDoctorScreen extends StatefulWidget {
  const EditDoctorScreen({super.key, required this.doctorModel});
  final DoctorModel doctorModel;

  @override
  State<EditDoctorScreen> createState() => _EditDoctorScreenState();
}

class _EditDoctorScreenState extends State<EditDoctorScreen> {
  late final TextEditingController nameController;
  late String selectedSpecialty;
  File? selectedImageFile;
  final List<String> availableSpecialties = [
    'Cardiology',
    'Orthopedic',
    'Dentist',
    'Neurology',
  ];
  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      setState(() {
        selectedImageFile = File(pickedFile.path);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.doctorModel.name);

    if (availableSpecialties.contains(widget.doctorModel.speciality)) {
      selectedSpecialty = widget.doctorModel.speciality;
    } else {
      selectedSpecialty = 'Cardiology';
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          AdminCubit(AdminRepository(adminService: AdminService())),
      child: AdminCustomScaffold(
        body: BlocConsumer<AdminCubit, AdminState>(
          listener: (context, state) {
            if (state is AdminSuccessState) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Doctor updated successfully!')),
              );
              context.pop();
            } else if (state is DoctorDeleteSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Doctor deleted successfully')),
              );
              context.pop();
            } else if (state is AdminFailureState) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
            }
          },
          builder: (context, state) {
            if (state is AdminLoadingState) {
              return Center(child: CircularProgressIndicator());
            }
            return SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: GestureDetector(
                      onTap: _pickImage,
                      child: Container(
                        height: 112.h,
                        width: 112.w,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey[200],
                          image: selectedImageFile != null
                              ? DecorationImage(
                                  image: FileImage(selectedImageFile!),
                                  fit: BoxFit.cover,
                                )
                              : (widget.doctorModel.imageUrl != null &&
                                        widget.doctorModel.imageUrl!.isNotEmpty
                                    ? DecorationImage(
                                        image: NetworkImage(
                                          widget.doctorModel.imageUrl!,
                                        ),
                                        fit: BoxFit.cover,
                                      )
                                    : null),
                        ),
                        child:
                            (selectedImageFile == null &&
                                (widget.doctorModel.imageUrl == null ||
                                    widget.doctorModel.imageUrl!.isEmpty))
                            ? Center(
                                child: Icon(
                                  Icons.person,
                                  size: 50.r,
                                  color: Colors.grey,
                                ),
                              )
                            : null,
                      ),
                    ),
                  ),

                  SizedBox(height: 12.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.camera_alt_outlined,
                        color: AppColor.green,
                        size: 14.r,
                      ),
                      SizedBox(width: 6.w),
                      Text(
                        'Tap photo to change',
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: AppColor.green,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 28.h),
                  Text('Doctor Name', style: TextStyles.label),
                  DoctorInputFieldContainer(
                    leadingIcon: Icon(
                      Icons.person_outline,
                      color: AppColor.blue,
                      size: 20.r,
                    ),
                    child: TextField(
                      controller: nameController,
                      decoration: InputDecoration(
                        hintText: widget.doctorModel.name,
                        hintStyle: TextStyles.textFieldValue,
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Text('SPECIALTY', style: TextStyles.label),
                  SizedBox(height: 6.h),
                  DoctorInputFieldContainer(
                    leadingIcon: Icon(
                      Icons.medical_services_outlined,
                      color: Colors.grey,
                    ), // Or your specialty icon
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
                      items:
                          [
                            'Cardiology',
                            'Orthopedic',
                            'Dentist',
                            'Neurology',
                          ].map((String specialty) {
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
                  SizedBox(height: 16.h),
                  DoctorInputFieldContainer(
                    leadingIcon: Icon(Icons.show_chart, color: AppColor.green),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Doctor Status',
                              style: TextStyles.textFieldValue,
                            ),
                            Text(
                              'Active & Available',
                              style: TextStyle(
                                color: AppColor.blue,
                                fontSize: 12.sp,
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                        Transform.scale(
                          scale: 0.5,
                          child: Switch(
                            value: true,
                            activeThumbColor: AppColor.green,
                            onChanged: (val) {},
                          ),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  GetStartedButton(
                    onTap: () async {
                      String finalImageUrl = widget.doctorModel.imageUrl ?? '';

                      if (selectedImageFile != null) {
                        final uploadedUrl = await CloudinaryService.uploadImage(
                          selectedImageFile!,
                        );
                        if (uploadedUrl != null) {
                          finalImageUrl = uploadedUrl;
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                'Failed to upload image to Cloudinary',
                              ),
                            ),
                          );
                          return;
                        }
                      }

                      final updateDoctor = DoctorModel(
                        id: widget.doctorModel.id,
                        name: nameController.text,
                        speciality: selectedSpecialty,
                        imageUrl: finalImageUrl,
                      );

                      context.read<AdminCubit>().updateDoctor(updateDoctor);
                    },
                    title: 'Save Changes',
                  ),
                  SizedBox(height: 22.h),
                  Center(
                    child: ClickedTextWidget(
                      onTap: () {
                        context.read<AdminCubit>().deleteDoctor(
                          widget.doctorModel.id,
                        );
                      },
                      text: 'Delete Doctor',
                      textColor: AppColor.red,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
