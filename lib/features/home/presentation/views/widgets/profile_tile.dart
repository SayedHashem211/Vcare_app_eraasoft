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
      color: Colors.black,
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 1, color: Colors.black),
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        title: Text(
          data.appointmentTime??"",
          style: GoogleFonts.roboto(
            color: Colors.grey,
            fontSize: 10.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        trailing: Text(
          data.status??"",
          style: GoogleFonts.roboto(
            color: Colors.grey,
            fontSize: 10.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}