import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gpa_calcos/Bussiness/calculation/GetUserInfoCubit/subject_info_cubit_cubit.dart';
import 'package:gpa_calcos/Bussiness/calculation/gpa_cubit/gpa_cubit.dart';
import 'package:gpa_calcos/Bussiness/user_cubit/user_cubit.dart';
import 'package:gpa_calcos/Presentation/Custom/files/colors.dart';
import 'package:gpa_calcos/Presentation/Custom/files/key.dart';
import 'package:gpa_calcos/Presentation/Routes/app_router.dart';
import 'package:gpa_calcos/Presentation/screens/chat_ai/providers/chat_provider.dart';
import 'package:gpa_calcos/Presentation/screens/chat_ai/providers/settings_provider.dart';
import 'package:gpa_calcos/firebase_options.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:calendar_view/calendar_view.dart';
import 'package:provider/provider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
void main() async {
  await Hive.initFlutter();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // Avoid screen from rotating when devide is slanted
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  Gemini.init(apiKey: GEMINI_API_KEY);
    await dotenv.load(fileName: ".env");

  await ChatProvider.initHive();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ChatProvider()),
        ChangeNotifierProvider(create: (context) => SettingsProvider()),
      ],
      child: MultiBlocProvider(providers: [
        BlocProvider(create: (context) => SubjectInfoCubit()),
        BlocProvider<UserCubit>(create: (context) => UserCubit()),
        BlocProvider(create: (context) => GpaCubit()),
      ], child: const MyApp()),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AppRouter appRouter = AppRouter();
  @override
  void initState() {
    setTheme();
    super.initState();
  }

  void setTheme() {
    final settingsProvider = context.read<SettingsProvider>();
    settingsProvider.getSavedSettings();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return CalendarControllerProvider(
          controller: EventController(),
          child: MaterialApp.router(
            routerConfig: appRouter.config(),
            debugShowCheckedModeBanner: false,
            title: 'GPA Guide',
            theme: ThemeData(
              primaryColor: MainColors.color5,
              textTheme: GoogleFonts.robotoTextTheme(textTheme).copyWith(
                bodyMedium: GoogleFonts.roboto(textStyle: textTheme.bodyMedium),
              ),
              colorScheme: ColorScheme.fromSeed(
                seedColor: const Color(0xffDDDDFF),
              ),
              useMaterial3: true,
            ),
          ),
        );
      },
    );
  }
}
