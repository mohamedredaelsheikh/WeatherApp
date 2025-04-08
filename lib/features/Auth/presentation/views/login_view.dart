import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:project/core/constant.dart';
import 'package:project/core/show_snack_bar.dart';
import 'package:project/features/Auth/presentation/manager/AuthBloc/auth_bloc.dart';
import 'package:project/features/Auth/presentation/views/register_view.dart';
import 'package:project/features/Auth/presentation/widgets/custombuttom.dart';
import 'package:project/features/Auth/presentation/widgets/customtextfield.dart';
import 'package:project/features/home/presentation/views/home_view.dart';

class LoginView extends StatefulWidget {
  static String id = 'LoginView';

  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  GlobalKey<FormState> formkey = GlobalKey();

  String? passward;

  String? email;

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is LoginLoadingState) {
          isLoading = true;
        } else if (state is LoginSuccesState) {
          isLoading = false;
          Navigator.pushNamed(context, HomeView.id, arguments: email);
        } else if (state is LoginFailureState) {
          isLoading = false;
          showSnackBar(context, state.error);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: isLoading,
          child: Scaffold(
            body: Container(
              // إضافة Gradient للخلفية
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFF4A90E2), // أزرق فاتح
                    Color(0xFF50C9CE), // سماوي
                  ],
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Form(
                  key: formkey,
                  child: ListView(
                    children: [
                      const SizedBox(height: 50),
                      // اللوجو
                      Image.asset(
                        kloge,
                        height: 150, // تقليل حجم اللوجو
                        fit: BoxFit.contain,
                      ),
                      const SizedBox(height: 20),
                      // نص الترحيب
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Welcome To Weather App',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Pacifico',
                              fontSize: 32,
                              shadows: [
                                Shadow(
                                  color: Colors.black26,
                                  offset: Offset(2, 2),
                                  blurRadius: 4,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 50),
                      // نص "Login"
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Login',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Pacifico',
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              shadows: [
                                Shadow(
                                  color: Colors.black26,
                                  offset: Offset(2, 2),
                                  blurRadius: 4,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      // TextField للإيميل
                      CustomFormTextField(
                        onchange: (data) {
                          email = data;
                        },
                        hinttext: 'Email',
                      ),
                      const SizedBox(height: 16),
                      // TextField للباسورد
                      CustomFormTextField(
                        obscure: true,
                        onchange: (data) {
                          passward = data;
                        },
                        hinttext: 'Password',
                      ),
                      const SizedBox(height: 30),
                      // زرار الـ Login
                      CustomButtom(
                        onTap: () async {
                          if (formkey.currentState!.validate()) {
                            BlocProvider.of<AuthBloc>(context).add(
                              LoginEvent(email: email!, passward: passward!),
                            );
                          }
                        },
                        buttomname: 'Login',
                      ),
                      const SizedBox(height: 20),
                      // نص التسجيل
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Don't have an account? ",
                            style: TextStyle(
                              color: Colors.white70,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, RegisterView.id);
                            },
                            child: const Text(
                              'Register',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
