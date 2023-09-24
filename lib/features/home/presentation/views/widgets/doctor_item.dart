import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class DoctorItem extends StatelessWidget {
  DoctorItem({
    Key? key,
    required this.doctorName,
    required this.doctorSpecialization
  }) : super(key: key);

  String doctorName;
  String doctorSpecialization;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 3.h / 4.w,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: const Color(0xFF174068),
            )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.13,
              decoration: BoxDecoration(
                color: Color(0xFF174068),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            Text(
              " $doctorName",
              style: GoogleFonts.inter(
                  color: Colors.black,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: 5.h,
            ),
            Text(
              '''
 $doctorSpecialization
 ''',
              style: GoogleFonts.inter(
                  color: Colors.grey,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400),
            ),
            const Spacer(),
            // SizedBox(height: 2.h,),
            Row(
              children: [
                Text(
                  "  more details",
                  style: GoogleFonts.inter(
                      color: Colors.black,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  width: 3.w,
                ),
                const Icon(
                  Icons.arrow_forward,
                  size: 20,
                  color: Colors.black,
                )
              ],
            ),
            SizedBox(height: 4.h,),
          ],
        ),
      ),
    );
  }
}
