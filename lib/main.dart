import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:profile_web/core/styles.dart';
import 'package:profile_web/data/settings.dart';
import 'package:profile_web/widgets/app_repository_action_button.dart';
import 'package:profile_web/widgets/content_button.dart';
import 'package:profile_web/widgets/content_tile.dart';
import 'package:profile_web/widgets/locale_action_button.dart';
import 'package:profile_web/widgets/outlined_panel.dart';
import 'package:profile_web/widgets/panel.dart';
import 'package:profile_web/widgets/theme_mode_action_button.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  GoogleFonts.config.allowRuntimeFetching = false;
  runApp(const ProfileApp());
}

class ProfileApp extends StatelessWidget {
  const ProfileApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return SettingsBinding(
      child: Builder(builder: (context) {
        final settings = Settings.of(context);
        return MaterialApp(
          title: 'Matgar',
          themeMode: settings.themeMode,
          theme: Styles.lightTheme,
          darkTheme: Styles.darkTheme,
          localizationsDelegates: const [
            AppLocalizations.delegate,
            ...GlobalMaterialLocalizations.delegates,
            ...GlobalCupertinoLocalizations.delegates,
            GlobalWidgetsLocalizations.delegate,
          ],
          supportedLocales: AppLocalizations.supportedLocales,
          locale: settings.locale,
          localeListResolutionCallback: (locales, supportedLocales) {
            deviceLocale = locales?.first;
            return basicLocaleListResolution(locales, supportedLocales);
          },
          home: const HomePage(),
        );
      }),
    );
  }
}

class HomePage extends StatelessWidget {
  static const _emailUrl = 'mailto:matgar@gmail.com?subject=Contact&body=Hi!';
  static const _githubUrl = 'https://github.com/matgar';
  static const _linkedInUrl = 'https://linkedin.com/in/matgar';
  static const _repositoryUrl = 'https://github.com/matgar/profile_web';

  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Text(localizations.homeTitle),
        actions: [
          AppRepositoryActionButton(
            onPressed: () => launchUrl(Uri.parse(_repositoryUrl)),
          ),
          const LocaleActionButton(),
          const ThemeModeActionButton(),
        ],
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 900),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
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
                      localizations.profileDescription,
                      textAlign: TextAlign.justify,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                  const SizedBox(height: 24),
                  OutlinedPanel(
                    child: ContentTile(
                      title: Text(localizations.contactPanelTitle),
                      children: [
                        ContentButton(
                          icon: const FaIcon(FontAwesomeIcons.github),
                          label: Text(localizations.githubAction),
                          onPressed: () => launchUrl(Uri.parse(_githubUrl)),
                        ),
                        const SizedBox(width: 6),
                        ContentButton(
                          icon: const FaIcon(FontAwesomeIcons.linkedinIn),
                          label: Text(localizations.linkedInAction),
                          onPressed: () => launchUrl(Uri.parse(_linkedInUrl)),
                        ),
                        const SizedBox(width: 6),
                        ContentButton(
                          icon: const Icon(Icons.email),
                          label: Text(localizations.emailAction),
                          onPressed: () => launchUrl(Uri.parse(_emailUrl)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
