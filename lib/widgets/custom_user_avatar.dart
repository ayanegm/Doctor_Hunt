import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomUserAvatar extends StatelessWidget {
  const CustomUserAvatar({
    super.key,
    this.selectedImageFile,
    this.imageUrl,
    required this.onTap,
    this.size = 112,
  });

  final File? selectedImageFile;
  final String? imageUrl;
  final VoidCallback onTap;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: size.h,
          width: size.w,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey[200],
            image: selectedImageFile != null
                ? DecorationImage(
                    image: FileImage(selectedImageFile!),
                    fit: BoxFit.cover,
                  )
                : (imageUrl != null && imageUrl!.isNotEmpty)
                ? DecorationImage(
                    image: NetworkImage(imageUrl!),
                    fit: BoxFit.cover,
                  )
                : null,
          ),
          child:
              (selectedImageFile == null &&
                  (imageUrl == null || imageUrl!.isEmpty))
              ? Center(
                  child: Icon(
                    Icons.person,
                    size: (size * 0.45).r,
                    color: Colors.grey,
                  ),
                )
              : null,
        ),
      ),
    );
  }
}
