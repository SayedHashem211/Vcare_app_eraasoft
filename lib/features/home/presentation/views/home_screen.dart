import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/networking/local/cache_helper.dart';
import '../../../../core/networking/local/enums.dart';
import '../../../login/presentation/views/login_page.dart';
import '../cubit/home_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late HomeCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = HomeCubit.get(context);
  }

  List<BottomNavyBarItem> tabs = [
    BottomNavyBarItem(
      icon: const Icon(Icons.home, color: Color(0xFF174068)),
      title: const Text(
        "Home",
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Color(0xFF174068)),
      ),
      activeColor: Colors.blue,
      inactiveColor: Colors.blueGrey,
    ),
    BottomNavyBarItem(
      icon: const Icon(
        Icons.local_hospital,
        color: Color(0xFF174068),
      ),
      title: const Text(
        "Doctors",
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Color(0xFF174068)),
      ),
      activeColor: const Color(0xFF174068),
      inactiveColor: const Color(0xFF174068),
    ),
    BottomNavyBarItem(
      icon: const Icon(Icons.search, color: Color(0xFF174068)),
      title: const Text("Search",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Color(0xFF174068))),
      activeColor: const Color(0xFF174068),
      inactiveColor: const Color(0xFF174068),
    ),
    BottomNavyBarItem(
      icon: const Icon(Icons.schedule_outlined, color: Color(0xFF174068)),
      title: const Text(
        "History",
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Color(0xFF174068)),
      ),
      activeColor: const Color(0xFF174068),
      inactiveColor: const Color(0xFF174068),
    ),
    BottomNavyBarItem(
      icon:
      const Icon(Icons.perm_contact_cal_rounded, color: Color(0xFF174068)),
      title: const Text(
        "Account",
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Color(0xFF174068)),
      ),
      activeColor: const Color(0xFF174068),
      inactiveColor: const Color(0xFF174068),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeCubit>.value(
      value: cubit..getHomeData(),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
          if (state is LogoutSuccessState) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Logout Successfully',),
                duration: Duration(seconds: 1),
                showCloseIcon: true,
              ),
            );

            CacheHelper.removeCacheKey(key: MySharedKeys.token).then((value) {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const LoginScreen();
              }));
            });
          }
          if (state is LogoutErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                  content: Text('Something Went Wrong'),
                  duration: Duration(seconds: 2)),
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: const Color(0xFF174068),
              elevation: 0,
              title: Text(
                "VCare",
                style: GoogleFonts.roboto(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
              leading: const Icon(
                Icons.menu,
                color: Colors.white,
              ),
            ),
            drawer: Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  DrawerHeader(
                    decoration: const BoxDecoration(
                      color: Colors.blue,
                    ),
                    child: Text(
                      'VCare',
                      style: GoogleFonts.roboto(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                  ),
                  ListTile(
                    title: const Text('Logout'),
                    onTap: () {
                      cubit.logout();
                    },
                  ),
                ],
              ),
            ),
            backgroundColor: Colors.white,
            bottomNavigationBar: BottomNavyBar(
              selectedIndex: cubit.currentIndex,
              showElevation: true,
              containerHeight: 60,
              itemCornerRadius: 24,
              curve: Curves.easeIn,
              iconSize: 30,
              onItemSelected: (index) => cubit.changeBot(index, context),
              items: tabs,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
            ),
            body: SafeArea(child: cubit.screens[cubit.currentIndex]),
          );
        },
      ),
    );
  }
}
