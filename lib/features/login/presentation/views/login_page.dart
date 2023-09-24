import 'package:buildcondition/buildcondition.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:v_care_app/features/login/presentation/cubit/login_cubit.dart';

import '../../../../core/networking/local/cache_helper.dart';
import '../../../../core/networking/local/enums.dart';
import '../../../../core/utils/components.dart';
import '../../../../core/utils/custom_button.dart';
import '../../../home/presentation/views/home_screen.dart';
import '../../../register/presentation/cubit/register_cubit.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  var formLoginKey = GlobalKey<FormState>();

  late LoginCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = LoginCubit.get(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccessState) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                  content: Text('Login Successfully'),
                  duration: Duration(seconds: 1),showCloseIcon: true,),
            );
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const HomeScreen();
            }));
            CacheHelper.putString(
                    key: MySharedKeys.token,
                    value: LoginCubit.get(context).loginModel?.data?.token)
                .then((value) {
              print(LoginCubit.get(context).loginModel?.data?.token);
            });
          }
          if (state is LoginErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Something Went Wrong')),
            );
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: SafeArea(
              child: Form(
                key: formLoginKey,
                child: Column(
                  children: [
                    SizedBox(
                      height: 40.h,
                    ),
                    Text(
                      "Welcome Back!",
                      style: GoogleFonts.roboto(
                          fontSize: 37.sp, fontWeight: FontWeight.w400),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Text(
                      '''Login to book appointment and 
    see all available doctors
                           ''',
                      style: GoogleFonts.roboto(
                          color: const Color(0xFF7C808A),
                          fontSize: 17.sp,
                          fontWeight: FontWeight.normal),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0.r),
                      child: defaultFormField(
                        type: TextInputType.emailAddress,
                        label: 'Email',
                        controller: emailController,
                        hint: 'Email',
                        validate: (value) {
                          if (value == null || value.isEmpty) {
                            return 'please add your email';
                          }
                          final bool isValid = EmailValidator.validate(value);
                          if (!isValid) {
                            return "please enter right email";
                          }
                          return null;
                        },
                        prefix: null,
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0.r),
                      child: defaultFormField(
                          label: 'Password',
                          suffix: LoginCubit.get(context).suffix,
                          isPassword: LoginCubit.get(context).isPassword,
                          suffixPressed: () {
                            LoginCubit.get(context).changePasswordVisibility();
                          },
                          type: TextInputType.visiblePassword,
                          controller: passwordController,
                          hint: 'Password',
                          prefix: null,
                          validate: (value) {
                            if (value.isEmpty) {
                              return 'Please enter password';
                            }
                            //         RegExp regex = RegExp(
                            //         r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[!@#\$&*~]).{8,}$');
                            //         if (!regex.hasMatch(value)) {
                            //         return
                            //           ''' password must contain at least one capital letter and
                            // one special character''';
                            //         }
                            return null;
                          }),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 7.w,
                        ),
                        Checkbox(
                          checkColor: Colors.white,
                          value: cubit.isChecked,
                          onChanged: (bool? value) {
                            cubit.changeCheckBox(value);
                          },
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Text(
                          "Keep me logged in",
                          style: GoogleFonts.roboto(
                              fontSize: 18.sp, fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      children: [
                        Text(
                          "    No account yet?",
                          style: GoogleFonts.roboto(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                    return const LoginScreen();
                                  }));
                            },
                            child: Text(
                              "Register here",
                              style: GoogleFonts.roboto(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w400,
                                  color: const Color.fromRGBO(3, 14, 25, 0.70)),
                            ))
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    SizedBox(
                        width: MediaQuery.of(context).size.width * 0.85,
                        height: 55.h,
                        child: BuildCondition(
                          condition: state is! LoginLoadingState,
                          builder: (context) => CustomButton(
                            text: 'Login',
                            onTap: () {
                              if (formLoginKey.currentState!.validate()) {
                                FocusScope.of(context).unfocus();
                                cubit.login(
                                  email: emailController.text,
                                  password: passwordController.text,
                                );
                              } else {
                                FocusScope.of(context).unfocus();
                              }
                            },
                          ),
                          fallback: (context) =>
                              const Center(child: CircularProgressIndicator()),
                        )),

                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
