import 'package:flutter/material.dart';
import 'package:profile_web/data/settings.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LocaleActionButton extends StatelessWidget {
  const LocaleActionButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => _changeMode(context),
      tooltip: AppLocalizations.of(context)?.localeActionTooltip,
      icon: _getIcon(context),
    );
  }

  void _changeMode(BuildContext context) {
    final settings = Settings.of(context);
    final currentLocale = settings.locale;

    if (currentLocale != null) {
      switch (currentLocale.languageCode) {
        case 'en':
          Settings.update(
            context,
            settings.copyWith(locale: const Locale('pt')),
          );
          break;
        case 'pt':
          Settings.update(
            context,
            settings.copyWith(locale: const Locale('en')),
          );
          break;
      }
    }
  }

  Widget _getIcon(BuildContext context) {
    final settings = Settings.of(context);
    final currentLocale = settings.locale;
    

    if (currentLocale != null) {
      const style = TextStyle(fontWeight: FontWeight.bold);

      switch (currentLocale.languageCode) {
        case 'en':
          return  const Text('Pt', style: style);
        case 'pt':
          return const Text('En', style: style);
      }
    }

    return const Icon(Icons.warning);
  }
}
