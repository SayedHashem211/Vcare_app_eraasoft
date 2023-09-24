import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:v_care_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:v_care_app/features/home/presentation/views/widgets/doctor_item.dart';

import 'doctor_profile.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  InkWell buildDoctorItem(BuildContext context, name, specialization, doctorId,
      email, phone, degree, gender) {
    Size size = MediaQuery
        .of(context)
        .size;
    return InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return DoctorProfileScreen(
                  specialization: specialization,
                  doctorId: doctorId,
                  name: name,
                  email: email,
                  phone: phone,
                  degree: degree,
                  gender: gender,
                );
              },
            ),
          );
        },
        child: DoctorItem(
          doctorName: name,
          doctorSpecialization: specialization,
        ));
  }

  late HomeCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = HomeCubit.get(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocConsumer<HomeCubit, HomeState>(
            listener: (context, state) {},
            builder: (context, state) {
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      " ${cubit.getHomeDataModel?.data?[0].name ?? ""}",
                      style: GoogleFonts.roboto(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    SizedBox(
                      height: MediaQuery
                          .of(context)
                          .size
                          .height * .28,
                      child: ListView.builder(
                          itemCount: cubit.getHomeDataModel?.data?[0].doctors
                              ?.length ?? 0,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10.0),
                              child:
                              buildDoctorItem(
                                context,
                                cubit.getHomeDataModel?.data?[0].doctors?[index]
                                    .name ?? "",
                                cubit.getHomeDataModel?.data?[0].doctors?[index]
                                    .specialization?.name ?? "",
                                cubit.getHomeDataModel?.data?[0].doctors?[index]
                                    .id ?? "",
                                cubit.getHomeDataModel?.data?[0].doctors?[index]
                                    .email ?? "",
                                cubit.getHomeDataModel?.data?[0].doctors?[index]
                                    .phone ?? "",
                                cubit.getHomeDataModel?.data?[0].doctors?[index]
                                    .degree ?? "",
                                cubit.getHomeDataModel?.data?[0].doctors?[index]
                                    .gender ?? "",
                              ),
                            );
                          }),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      " ${cubit.getHomeDataModel?.data?[1].name ?? ""}",
                      style: GoogleFonts.roboto(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    SizedBox(
                      height: MediaQuery
                          .of(context)
                          .size
                          .height * .28,
                      child: ListView.builder(
                          itemCount: cubit.getHomeDataModel?.data?[1].doctors
                              ?.length ?? 0,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10.0),
                              child:
                              buildDoctorItem(
                                context,
                                cubit.getHomeDataModel?.data?[1].doctors?[index]
                                    .name ?? "",
                                cubit.getHomeDataModel?.data?[1].doctors?[index]
                                    .specialization?.name ?? "",
                                cubit.getHomeDataModel?.data?[1].doctors?[index]
                                    .id ?? "",
                                cubit.getHomeDataModel?.data?[1].doctors?[index]
                                    .email ?? "",
                                cubit.getHomeDataModel?.data?[1].doctors?[index]
                                    .phone ?? "",
                                cubit.getHomeDataModel?.data?[1].doctors?[index]
                                    .degree ?? "",
                                cubit.getHomeDataModel?.data?[1].doctors?[index]
                                    .gender ?? "",
                              ),
                            );
                          }),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      " ${cubit.getHomeDataModel?.data?[2].name ?? ""}",
                      style: GoogleFonts.roboto(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    SizedBox(
                      height: MediaQuery
                          .of(context)
                          .size
                          .height * .28,
                      child: ListView.builder(
                          itemCount: cubit.getHomeDataModel?.data?[2].doctors
                              ?.length ?? 0,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10.0),
                              child:
                              buildDoctorItem(
                                context,
                                cubit.getHomeDataModel?.data?[2].doctors?[index]
                                    .name ?? "",
                                cubit.getHomeDataModel?.data?[2].doctors?[index]
                                    .specialization?.name ?? "",
                                cubit.getHomeDataModel?.data?[2].doctors?[index]
                                    .id ?? "",
                                cubit.getHomeDataModel?.data?[2].doctors?[index]
                                    .email ?? "",
                                cubit.getHomeDataModel?.data?[2].doctors?[index]
                                    .phone ?? "",
                                cubit.getHomeDataModel?.data?[2].doctors?[index]
                                    .degree ?? "",
                                cubit.getHomeDataModel?.data?[2].doctors?[index]
                                    .gender ?? "",
                              ),
                            );
                          }),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      " ${cubit.getHomeDataModel?.data?[3].name ?? ""}",
                      style: GoogleFonts.roboto(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    SizedBox(
                      height: MediaQuery
                          .of(context)
                          .size
                          .height * .28,
                      child: ListView.builder(
                          itemCount: cubit.getHomeDataModel?.data?[3].doctors
                              ?.length ?? 0,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10.0),
                              child:
                              buildDoctorItem(
                                context,
                                cubit.getHomeDataModel?.data?[3].doctors?[index]
                                    .name ?? "",
                                cubit.getHomeDataModel?.data?[3].doctors?[index]
                                    .specialization?.name ?? "",
                                cubit.getHomeDataModel?.data?[3].doctors?[index]
                                    .id ?? "",
                                cubit.getHomeDataModel?.data?[3].doctors?[index]
                                    .email ?? "",
                                cubit.getHomeDataModel?.data?[3].doctors?[index]
                                    .phone ?? "",
                                cubit.getHomeDataModel?.data?[3].doctors?[index]
                                    .degree ?? "",
                                cubit.getHomeDataModel?.data?[3].doctors?[index]
                                    .gender ?? "",
                              ),
                            );
                          }),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      " ${cubit.getHomeDataModel?.data?[4].name ?? ""}",
                      style: GoogleFonts.roboto(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    SizedBox(
                      height: MediaQuery
                          .of(context)
                          .size
                          .height * .28,
                      child: ListView.builder(
                          itemCount: cubit.getHomeDataModel?.data?[4].doctors
                              ?.length ?? 0,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10.0),
                              child:
                              buildDoctorItem(
                                context,
                                cubit.getHomeDataModel?.data?[4].doctors?[index]
                                    .name ?? "",
                                cubit.getHomeDataModel?.data?[0].doctors?[index]
                                    .specialization?.name ?? "",
                                cubit.getHomeDataModel?.data?[4].doctors?[index]
                                    .id ?? "",
                                cubit.getHomeDataModel?.data?[4].doctors?[index]
                                    .email ?? "",
                                cubit.getHomeDataModel?.data?[4].doctors?[index]
                                    .phone ?? "",
                                cubit.getHomeDataModel?.data?[4].doctors?[index]
                                    .degree ?? "",
                                cubit.getHomeDataModel?.data?[4].doctors?[index]
                                    .gender ?? "",
                              ),
                            );
                          }),
                    ),
                    SizedBox(height: 5.h,),
                  ],
                ),
              );
            }
        )
    );
  }
}
