import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserAvatarDisplay extends StatelessWidget {
  const UserAvatarDisplay({
    super.key,
    this.imageUrl,
    this.height,
    this.width,
    this.radius,
  });

  final String? imageUrl;
  final double? height;
  final double? width;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    // If a radius is provided, we can use a CircleAvatar or ClipRoval
    if (radius != null) {
      return CircleAvatar(
        radius: radius!.r,
        backgroundColor: Colors.grey[200],
        backgroundImage: (imageUrl != null && imageUrl!.isNotEmpty)
            ? NetworkImage(imageUrl!) as ImageProvider
            : null,
        child: (imageUrl == null || imageUrl!.isEmpty)
            ? Icon(Icons.person, size: (radius! * 1.1).r, color: Colors.grey)
            : null,
      );
    }

    // Otherwise, use a Container with custom height/width (like your HomePage header)
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.grey[200],
        image: (imageUrl != null && imageUrl!.isNotEmpty)
            ? DecorationImage(image: NetworkImage(imageUrl!), fit: BoxFit.cover)
            : null,
      ),
      child: (imageUrl == null || imageUrl!.isEmpty)
          ? Center(
              child: Icon(
                Icons.person,
                size: ((height ?? 50) * 0.5).r,
                color: Colors.grey,
              ),
            )
          : null,
    );
  }
}
