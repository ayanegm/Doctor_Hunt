import 'package:doctor_hunt/core/utils/color.dart';
import 'package:doctor_hunt/core/utils/text_styles.dart';
import 'package:doctor_hunt/features/admin/presentation/widgets/clicked_text_widget.dart';
import 'package:doctor_hunt/features/admin/presentation/widgets/doctor_input_field_container.dart';
import 'package:doctor_hunt/features/onboarding/widgets/get_started_button.dart';
import 'package:doctor_hunt/widgets/admin_custom_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditAdminProfileScreen extends StatelessWidget {
  const EditAdminProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AdminCustomScaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: ClickedTextWidget(
              text: 'Tap photo to change',
              onTap: () {},
              textColor: AppColor.green,
            ),
          ),
          Text('DOCTOR NAME', style: TextStyles.label),
          DoctorInputFieldContainer(
            leadingIcon: Icon(
              Icons.person_outline,
              color: AppColor.blue,
              size: 20.r,
            ),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Dr. Ahmed Ali',
                hintStyle: TextStyles.textFieldValue,
                border: InputBorder.none,
              ),
            ),
          ),
          SizedBox(height: 16.h),
          Text('EMAIL ADDRESS', style: TextStyles.label),
          DoctorInputFieldContainer(
            leadingIcon: Icon(
              Icons.email_outlined,
              color: AppColor.blue,
              size: 20.r,
            ),
            child: TextField(
              decoration: InputDecoration(
                hintText: '',
                hintStyle: TextStyles.textFieldValue,
                border: InputBorder.none,
              ),
            ),
          ),
          Spacer(),
          GetStartedButton(onTap: () {}, title: 'Save Changes'),
        ],
      ),
    );
  }
}
