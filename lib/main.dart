import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:profile_web/core/strings.dart';
import 'package:profile_web/core/styles.dart';
import 'package:profile_web/data/settings.dart';
import 'package:profile_web/widgets/content_button.dart';
import 'package:profile_web/widgets/content_tile.dart';
import 'package:profile_web/widgets/outlined_panel.dart';
import 'package:profile_web/widgets/panel.dart';
import 'package:profile_web/widgets/theme_mode_action_button.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const ProfileApp());
}

class ProfileApp extends StatelessWidget {
  const ProfileApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return SettingsBinding(
      child: Builder(builder: (context) {
        return MaterialApp(
          title: Strings.appTitle,
          themeMode: Settings.of(context).themeMode,
          theme: Styles.lightTheme,
          darkTheme: Styles.darkTheme,
          home: const HomePage(title: Strings.homeTitle),
        );
      }),
    );
  }
}

class HomePage extends StatelessWidget {

  static const _emailUrl = 'mailto:matgar@gmail.com?subject=Contact&body=Hi!';
  static const _githubUrl = 'https://github.com/matgar';
  static const _linkedInUrl = 'https://linkedin.com/in/matgar';

  final String title;

  const HomePage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: const [ThemeModeActionButton()],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 240,
                width: 240,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage('assets/images/profile-pic.png'),
                  ),
                ),
              ),
              const SizedBox(height: 14),
              Panel(
                child: Text(
                  Strings.profileDescription,
                  textAlign: TextAlign.justify,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
              const SizedBox(height: 24),
               OutlinedPanel(
                child: ContentTile(
                  title: const Text(Strings.contactPanelTitle),
                  children: [
                    ContentButton(
                      icon: const Icon(Icons.email),
                      label: const Text(Strings.emailAction),
                      onPressed: () => launchUrl(Uri.parse(_emailUrl)),
                    ),
                    const SizedBox(width: 6),
                    ContentButton(
                      icon: const FaIcon(FontAwesomeIcons.github),
                      label: const Text(Strings.githubAction),
                      onPressed: () => launchUrl(Uri.parse(_githubUrl)),
                    ),
                    const SizedBox(width: 6),
                    ContentButton(
                      icon: const FaIcon(FontAwesomeIcons.linkedinIn),
                      label: const Text(Strings.linkedInAction),
                      onPressed: () => launchUrl(Uri.parse(_linkedInUrl)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
