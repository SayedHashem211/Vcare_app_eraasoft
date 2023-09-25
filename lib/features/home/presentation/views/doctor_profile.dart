import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:v_care_app/core/utils/custom_button.dart';
import 'package:v_care_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:v_care_app/features/home/presentation/views/booking_screen.dart';

class DoctorProfileScreen extends StatefulWidget {
  final dynamic name;
  final dynamic specialization;
  final dynamic doctorId;
  final dynamic email;
  final dynamic phone;
  final dynamic degree;
  final dynamic gender;

  const DoctorProfileScreen(
      {super.key,
      required this.name,
      required this.specialization,
      required this.doctorId,
      required this.email,
      required this.phone,
      required this.degree,
      required this.gender});

  @override
  State<DoctorProfileScreen> createState() => _DoctorProfileScreenState();
}

class _DoctorProfileScreenState extends State<DoctorProfileScreen> {

  late HomeCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = HomeCubit.get(context);
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
  listener: (context, state) {
  },
  builder: (context, state) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Lottie.asset('assets/lotties/doctor.json',
                    height: MediaQuery.of(context).size.height * 0.3,
                    width: MediaQuery.of(context).size.width * 0.94),
                Text(
                  "Doctor Name",
                  style: GoogleFonts.roboto(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    '${widget.name}',
                    style: GoogleFonts.roboto(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey),
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  "Specialization",
                  style: GoogleFonts.roboto(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    '${widget.specialization}',
                    style: GoogleFonts.roboto(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey),
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  "Email address",
                  style: GoogleFonts.roboto(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    '${widget.email}',
                    style: GoogleFonts.roboto(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey),
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  "Phone number",
                  style: GoogleFonts.roboto(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    '${widget.phone}',
                    style: GoogleFonts.roboto(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey),
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  "Degree",
                  style: GoogleFonts.roboto(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    '${widget.degree}',
                    style: GoogleFonts.roboto(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey),
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  "Gender",
                  style: GoogleFonts.roboto(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    '${widget.gender}',
                    style: GoogleFonts.roboto(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey),
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: 45.h,
                  child: CustomButton(
                      text: "BOOK AN APPOINTMENT",
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context){
                          return BookingScreen(
                            doctorId: widget.doctorId,
                          );
                        }));
                      }
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  },
);
  }
}
