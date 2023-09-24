
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:v_care_app/features/home/presentation/views/widgets/profile_tile.dart';
import '../cubit/home_cubit.dart';

class AccountTab extends StatefulWidget {
  const AccountTab({Key? key}) : super(key: key);

  @override
  State<AccountTab> createState() => _AccountTabState();
}

class _AccountTabState extends State<AccountTab> {
  late HomeCubit cubit;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cubit=HomeCubit.get(context);
  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 29.0),
            child: Column(
              children: [
                SizedBox(height: 20.h,),
                const Center(child: Icon(Icons.person_2_outlined)),
                SizedBox(height: 5.h,),
                Center(
                  child: Text(
                    'user name',
                    style: GoogleFonts.inter(
                      color: Colors.black,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w400,

                    ),
                  ),
                ),
                SizedBox(height: 5.h,),
                Center(
                  child: InkWell(
                    onTap: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'edit account details ',
                          style: GoogleFonts.inter(
                            color: Colors.grey,
                            fontSize: 15.5.sp,
                            fontWeight: FontWeight.w400,

                          ),
                        ),
                        const Icon(Icons.edit_outlined, color: Colors.grey,),

                      ],
                    ),
                  ),
                ),
                SizedBox(height: 2.h,),
                const Divider(color: Colors.grey,),
                SizedBox(height: 2.h,),
                Row(
                  children: [
                    const Icon(
                      Icons.email_outlined, color: Colors.black,),
                    SizedBox(width: 3.w,),
                    Text(
                      'employee@email.com',
                      style: GoogleFonts.inter(
                        color: Colors.black,
                        fontSize: 15.5.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    )

                  ],
                ),
                SizedBox(height: 20.h,),
                Row(
                  children: [
                    const Icon(
                      Icons.phone_outlined, color: Colors.black,),
                    SizedBox(width: 3.w,),
                    Text(
                      '+20123178903',
                      style: GoogleFonts.inter(
                        color: Colors.black,
                        fontSize: 15.5.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    )

                  ],
                ),
                SizedBox(height: 20.h,),
                Row(
                  children: [
                    const Icon(Icons.lock_outline, color: Colors.black,),
                    SizedBox(width: 3.w,),
                    Text(
                      '•••••••••••',
                      style: GoogleFonts.inter(
                        color: Colors.black,
                        fontSize: 15.5.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    )

                  ],
                ),

              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20.h,),
                Text(
                  'History',
                  style: GoogleFonts.inter(
                      color: Colors.black,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w400,
                      decoration: TextDecoration.underline
                  ),
                ),
                SizedBox(height: 20.h,),
                BlocBuilder<HomeCubit, HomeState>(
                  builder: (context, state) {
                    return ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) =>  ProfileTile(data: cubit.appointmentsData[index],),
                        separatorBuilder: (context, index) =>
                            SizedBox(height: 1.h,),
                        itemCount: cubit.appointmentsData.length);
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}