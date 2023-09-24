import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:v_care_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:v_care_app/features/home/presentation/views/widgets/doctor_item.dart';

import 'doctor_profile.dart';

class DoctorsTab extends StatefulWidget {
  const DoctorsTab({Key? key}) : super(key: key);

  @override
  State<DoctorsTab> createState() => _DoctorsTabState();
}

class _DoctorsTabState extends State<DoctorsTab> {
  late HomeCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = HomeCubit.get(context);
  }


  @override
  Widget build(BuildContext context) {
    InkWell buildDoctorItem(BuildContext context, name, specialization , doctorId , email , phone ,degree , gender) {
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
                   specialization :specialization,
                    doctorId : doctorId,
                    name : name,
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
          )
      );
    }
    return Scaffold(
      body: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {

        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 20.h,
                ),
                BuildCondition(
                    condition: state is! GetAllDoctorsLoadingState,
                    builder: (context) =>
                        BuildCondition(
                          condition:
                          cubit.getAllDoctorsModel!.data!.isNotEmpty,
                          builder: (context) => GridView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                childAspectRatio: 5.h / 6.w,
                                crossAxisCount: 2,
                                crossAxisSpacing: 4.w,
                                mainAxisSpacing: 15.h,
                              ),
                              itemCount: 10,
                              itemBuilder: (BuildContext ctx, index) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0),
                                  child: buildDoctorItem(
                                    context,
                                    cubit.getAllDoctorsModel!.data![index].name,
                                      cubit.getAllDoctorsModel!.data![index].specialization!.name,
                                    cubit.getAllDoctorsModel!.data![index].specialization!.id,
                                    cubit.getAllDoctorsModel!.data![index].email,
                                    cubit.getAllDoctorsModel!.data![index].phone,
                                    cubit.getAllDoctorsModel!.data![index].degree,
                                    cubit.getAllDoctorsModel!.data![index].gender,

                                  ),
                                );
                              }
                              ),
                          fallback: (context) => Padding(
                            padding: const EdgeInsets.only(
                                top: 100, right: 10, left: 10),
                            child: Text(
                                "No Doctors Yet",
                                style: GoogleFonts.roboto(
                                fontSize: 30.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey),),
                          ),
                        ),
                  fallback: (context) =>
                  const Center(child: CircularProgressIndicator()),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

