import 'package:flutter/material.dart';

enum AppointmentStatus { completed, upcoming, live, rescheduled, cancelled }

extension AppointmentStatusExtension on AppointmentStatus {
  String get label {
    switch (this) {
      case AppointmentStatus.completed:
        return 'Completed';
      case AppointmentStatus.upcoming:
        return 'Upcoming';
      case AppointmentStatus.live:
        return 'Live';
      case AppointmentStatus.rescheduled:
        return 'Rescheduled';
      case AppointmentStatus.cancelled:
        return 'Cancelled';
    }
  }

  Color get backgroundColor {
    switch (this) {
      case AppointmentStatus.completed:
      case AppointmentStatus.live:
        return Colors.green.withOpacity(0.15);
      case AppointmentStatus.upcoming:
        return Colors.blue.withOpacity(0.15);
      case AppointmentStatus.rescheduled:
        return Colors.orange.withOpacity(0.15);
      case AppointmentStatus.cancelled:
        return Colors.red.withOpacity(0.15);
    }
  }

  Color get textColor {
    switch (this) {
      case AppointmentStatus.completed:
      case AppointmentStatus.live:
        return Colors.green;
      case AppointmentStatus.upcoming:
        return Colors.blue;
      case AppointmentStatus.rescheduled:
        return Colors.orange;
      case AppointmentStatus.cancelled:
        return Colors.red;
    }
  }
}
