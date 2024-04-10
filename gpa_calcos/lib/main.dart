import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gpa_calcos/Bussiness/calculation/gpa_cubit/gpa_cubit.dart';
import 'package:gpa_calcos/Presentation/Routes/app_router.dart';
import 'package:gpa_calcos/firebase_options.dart';

void main() async {
  runApp(const MyApp());
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        AppRouter appRouter = AppRouter();
        return BlocProvider(
          lazy: false,
          create: (context) => GpaCubit(),
          child: MaterialApp.router(
            routerConfig: appRouter.config(),
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              textTheme: GoogleFonts.oswaldTextTheme(textTheme).copyWith(
                bodyMedium: GoogleFonts.lato(textStyle: textTheme.bodyMedium),
              ),
              colorScheme:
                  ColorScheme.fromSeed(seedColor: const Color(0xFF5E8D9B)),
              useMaterial3: true,
            ),
          ),
        );
      },
    );
  }
}
