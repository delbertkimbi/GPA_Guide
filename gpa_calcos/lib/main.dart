import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gpa_calcos/Bussiness/calculation/gpa_cubit/gpa_cubit.dart';
import 'package:gpa_calcos/Presentation/Custom/files/key.dart';
import 'package:gpa_calcos/Presentation/Routes/app_router.dart';

void main() async {
  Gemini.init(apiKey: GEMINI_API_KEY);
  runApp(MultiBlocProvider(providers: [
    BlocProvider(create: (context) => GpaCubit()),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final AppRouter appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp.router(
          routerConfig: appRouter.config(),
          debugShowCheckedModeBanner: false,
          title: 'GPA Calcos',
          theme: ThemeData(
            textTheme: GoogleFonts.robotoTextTheme(textTheme).copyWith(
              bodyMedium: GoogleFonts.poppins(textStyle: textTheme.bodyMedium),
            ),
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
            useMaterial3: true,
          ),
        );
      },
    );
  }
}
