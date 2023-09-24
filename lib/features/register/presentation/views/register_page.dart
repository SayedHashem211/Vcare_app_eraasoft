import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:email_validator/email_validator.dart';
import 'package:v_care_app/features/register/presentation/cubit/register_cubit.dart';
import '../../../../core/networking/local/cache_helper.dart';
import '../../../../core/networking/local/enums.dart';
import '../../../../core/utils/components.dart';
import '../../../../core/utils/custom_button.dart';
import '../../../login/presentation/views/login_page.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  var formRegisterKey = GlobalKey<FormState>();
  late RegisterCubit cubit;

  void initState() {
    super.initState();
    cubit = RegisterCubit.get(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if (state is RegisterSuccessState) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Registered Successfully'),
              duration: Duration(seconds: 1),
                showCloseIcon: true,
              ),
            );
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const LoginScreen();
            }));
            CacheHelper.putString(
                    key: MySharedKeys.token,
                    value:
                        RegisterCubit.get(context).registerModel?.data?.token)
                .then((value) {
              print(RegisterCubit.get(context).registerModel?.data?.token);
            });
          }
          if (state is RegisterErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Something Went Wrong')),
            );
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: SafeArea(
              child: Form(
                key: formRegisterKey,
                child: Column(
                  children: [
                    SizedBox(
                      height: 40.h,
                    ),
                    Text(
                      "Let's get started!",
                      style: GoogleFonts.roboto(
                          fontSize: 37.sp, fontWeight: FontWeight.w400),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Text(
                      '''create an account and start booking now
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
                        type: TextInputType.name,
                        label: 'Name',
                        controller: nameController,
                        hint: 'Name',
                        validate: (value) {
                          if (value == null || value.isEmpty) {
                            return 'please add your name';
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
                        type: TextInputType.phone,
                        label: 'Phone',
                        controller: phoneController,
                        hint: 'Phone',
                        validate: (value) {
                          if (value == null || value.isEmpty) {
                            return 'please add your Phone';
                          }
                          if (value.toString().length > 11 ||
                              value.toString().length < 11) {
                            return "please enter right phone number";
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
                          suffix: RegisterCubit.get(context).suffix,
                          isPassword: RegisterCubit.get(context).isPassword,
                          suffixPressed: () {
                            RegisterCubit.get(context)
                                .changePasswordVisibility();
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
                      height: 10.h,
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0.r),
                      child: defaultFormField(
                          label: 'Confirm Password',
                          suffix: RegisterCubit.get(context).suffix,
                          isPassword: RegisterCubit.get(context).isPassword,
                          suffixPressed: () {
                              RegisterCubit.get(context).changePasswordVisibility();

                          },
                          type: TextInputType.visiblePassword,
                          controller: confirmPasswordController,
                          hint: 'Confirm Password',
                          prefix: null,
                          validate: (value) {
                            if (value.isEmpty) {
                              return 'Please enter password';
                            }
                             if (value != confirmPasswordController.text){
                               return 'confirm password must match password';
                               //         RegExp regex = RegExp(
                               //         r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[!@#\$&*~]).{8,}$');
                               //         if (!regex.hasMatch(value)) {
                               //         return
                               //           ''' password must contain at least one capital letter and
                               // one special character''';
                               //         }
                               return null;
                             }
                          }),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 7.w,
                        ),
                        Checkbox(
                          checkColor: Colors.white,
                          //fillColor: MaterialStateProperty.resolveWith(getColor),
                          value: cubit.isMaleChecked,
                          onChanged: (bool? value) {
                            cubit.changeCheckBoxOfMale(value);
                          },
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Text(
                          "Male",
                          style: GoogleFonts.roboto(
                              fontSize: 18.sp, fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          width: 7.w,
                        ),
                        Checkbox(
                          checkColor: Colors.white,
                          //fillColor: MaterialStateProperty.resolveWith(getColor),
                          value: cubit.isFemaleChecked,
                          onChanged: (bool? value) {
                            cubit.changeCheckBoxOfFemale(value);
                          },
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Text(
                          "Female",
                          style: GoogleFonts.roboto(
                              fontSize: 18.sp, fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Row(
                      children: [
                        Text(
                          "    Already have an account?",
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
                              "Login here",
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
                          condition: state is! RegisterLoadingState,
                          builder: (context) => CustomButton(
                            text: 'Register',
                            onTap: () {
                              if (formRegisterKey.currentState!.validate()) {
                                FocusScope.of(context).unfocus();
                                cubit.register(
                                    name: nameController.text,
                                    email: emailController.text,
                                    phone: phoneController.text,
                                    password: passwordController.text,
                                    passwordConfirmation:
                                        confirmPasswordController.text);
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
