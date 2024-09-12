import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:gpa_calcos/Presentation/screens/chat_ai/colors.dart';
import 'package:gpa_calcos/Presentation/screens/chat_ai/hive/boxes.dart';
import 'package:gpa_calcos/Presentation/screens/chat_ai/hive/settings.dart';
import 'package:gpa_calcos/Presentation/screens/chat_ai/providers/settings_provider.dart';
import 'package:gpa_calcos/Presentation/screens/chat_ai/widgets/build_diaplay_image.dart';
import 'package:gpa_calcos/Presentation/screens/chat_ai/widgets/settings_tile.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  File? file;
  String userImage = '';
  String userName = 'Delbert';
  final ImagePicker _picker = ImagePicker();

  // pick an image
  void pickImage() async {
    try {
      final pickedImage = await _picker.pickImage(
        source: ImageSource.gallery,
        maxHeight: 800,
        maxWidth: 800,
        imageQuality: 95,
      );
      if (pickedImage != null) {
        setState(() {
          file = File(pickedImage.path);
        });
      }
    } catch (e) {
      log('error : $e');
    }
  }

  // get user data
  void getUserData() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // get user data fro box
      final userBox = Boxes.getUser();

      // check is user data is not empty
      if (userBox.isNotEmpty) {
        final user = userBox.getAt(0);
        setState(() {
          userImage = user!.name;
          userName = user.image;
        });
      }
    });
  }

  @override
  void initState() {
    getUserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.color4,
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              )),
          title: Text(
            'Profile',
            style: TextStyle(
              color: AppColors.color5,
            ),
          ),
          centerTitle: true,
          backgroundColor: AppColors.color2,
          actions: [
            IconButton(
              icon: Icon(
                Icons.check,
                color: AppColors.color5,
              ),
              onPressed: () {
                // save data
              },
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 20.0,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Center(
                  child: BuildDisplayImage(
                      file: file,
                      userImage: userImage,
                      onPressed: () {
                        // open camera or gallery
                        pickImage();
                      }),
                ),

                const SizedBox(height: 20.0),

                // user name
                Text(userName, style: Theme.of(context).textTheme.titleLarge),

                const SizedBox(height: 40.0),

                ValueListenableBuilder<Box<Settings>>(
                    valueListenable: Boxes.getSettings().listenable(),
                    builder: (context, box, child) {
                      if (box.isEmpty) {
                        return Column(
                          children: [
                            // ai voice
                            SettingsTile(
                                icon: Icons.mic,
                                title: 'Enable AI voice',
                                value: false,
                                onChanged: (value) {
                                  final settingProvider =
                                      context.read<SettingsProvider>();
                                  settingProvider.toggleSpeak(
                                    value: value,
                                  );
                                }),

                            const SizedBox(height: 10.0),

                            // theme
                            SettingsTile(
                                icon: Icons.light_mode,
                                title: 'Theme',
                                value: false,
                                onChanged: (value) {
                                  final settingProvider =
                                      context.read<SettingsProvider>();
                                  settingProvider.toggleDarkMode(
                                    value: value,
                                  );
                                }),
                          ],
                        );
                      } else {
                        final settings = box.getAt(0);
                        return Column(
                          children: [
                            // ai voice
                            SettingsTile(
                                icon: Icons.mic,
                                title: 'Enable AI voice',
                                value: settings!.shouldSpeak,
                                onChanged: (value) {
                                  final settingProvider =
                                      context.read<SettingsProvider>();
                                  settingProvider.toggleSpeak(
                                    value: value,
                                  );
                                }),

                            const SizedBox(height: 10.0),

                            // theme
                            SettingsTile(
                                icon: settings.isDarkTheme
                                    ? Icons.dark_mode
                                    : Icons.light_mode,
                                title: 'Theme',
                                value: settings.isDarkTheme,
                                onChanged: (value) {
                                  final settingProvider =
                                      context.read<SettingsProvider>();
                                  settingProvider.toggleDarkMode(
                                    value: value,
                                  );
                                }),
                          ],
                        );
                      }
                    })
              ],
            ),
          ),
        ));
  }
}
