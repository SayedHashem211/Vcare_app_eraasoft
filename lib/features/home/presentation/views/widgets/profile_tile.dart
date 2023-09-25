import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../data/models/get_all_appointments_model.dart';


class ProfileTile extends StatelessWidget {
  const ProfileTile({Key? key,required this.data}) : super(key: key);
  final AppointmentsData data;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 4),
      margin: EdgeInsets.all(3),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 1, color: Color(0xFF174068)),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        title: Text(
          data.appointmentTime??"",
          style: GoogleFonts.roboto(
            color: Colors.grey,
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        trailing: Text(
          data.status??"",
          style: GoogleFonts.roboto(
            color: Colors.grey,
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}