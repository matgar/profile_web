import 'package:flutter/material.dart';
import 'package:profile_web/core/strings.dart';
import 'package:profile_web/data/settings.dart';

class ThemeModeActionButton extends StatelessWidget {
  const ThemeModeActionButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => _changeMode(context),
      icon: Icon(_getIcon(context)),
      tooltip: _getTooltip(context),
    );
  }

  String _getTooltip(BuildContext context) {
    switch (Settings.of(context).resolvedBrightness()) {
      case Brightness.dark:
        return Strings.lightThemeActionTooltip;
      case Brightness.light:
        return Strings.darkThemeActionTooltip;
    }
  }

  IconData _getIcon(BuildContext context) {
    switch (Settings.of(context).resolvedBrightness()) {
      case Brightness.dark:
        return Icons.light_mode;
      case Brightness.light:
        return Icons.dark_mode;
    }
  }
}

void _changeMode(BuildContext context) {
  final settings = Settings.of(context);
  switch (settings.resolvedBrightness()) {
    case Brightness.dark:
      Settings.update(context, settings.copyWith(themeMode: ThemeMode.light));
      break;
    case Brightness.light:
      Settings.update(context, settings.copyWith(themeMode: ThemeMode.dark));
      break;
  }
}
