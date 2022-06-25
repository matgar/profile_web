import 'package:flutter/material.dart';

Locale? _deviceLocale;
Locale? get deviceLocale => _deviceLocale;
set deviceLocale(Locale? locale) {
  _deviceLocale = locale;
}

class Settings {
  final ThemeMode? themeMode;
  final Locale? _locale;

  const Settings._({
    this.themeMode = ThemeMode.system,
    Locale? locale,
  }) : _locale = locale;

  static Settings of(BuildContext context) {
    final scope =
        context.dependOnInheritedWidgetOfExactType<_SettingsBindingScope>()!;
    return scope.settingsBindingState.currentSettings;
  }

  Locale? get locale => _locale ?? deviceLocale;

  Brightness resolvedBrightness() {
    switch (themeMode) {
      case ThemeMode.dark:
        return Brightness.dark;
      case ThemeMode.light:
        return Brightness.light;
      default:
        return WidgetsBinding.instance!.window.platformBrightness;
    }
  }

  Settings copyWith({
    ThemeMode? themeMode,
    Locale? locale,
  }) =>
      Settings._(
        themeMode: themeMode ?? this.themeMode,
        locale: locale ?? this.locale,
      );

  @override
  bool operator ==(Object other) =>
      other is Settings &&
      themeMode == other.themeMode &&
      locale == other.locale;

  @override
  int get hashCode => Object.hash(themeMode, locale);

  static void update(BuildContext context, Settings settings) {
    final scope =
        context.dependOnInheritedWidgetOfExactType<_SettingsBindingScope>()!;
    scope.settingsBindingState.update(settings);
  }
}

class SettingsBinding extends StatefulWidget {
  final Settings initialSettings;
  final Widget child;

  const SettingsBinding({
    Key? key,
    this.initialSettings = const Settings._(),
    required this.child,
  }) : super(key: key);

  @override
  State<SettingsBinding> createState() => _SettingsBindingState();
}

class _SettingsBindingState extends State<SettingsBinding> {
  late Settings currentSettings;

  @override
  void initState() {
    super.initState();
    currentSettings = widget.initialSettings;
  }

  void update(Settings settings) {
    if (currentSettings != settings) {
      setState(() {
        currentSettings = settings;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return _SettingsBindingScope(
      settingsBindingState: this,
      child: widget.child,
    );
  }
}

class _SettingsBindingScope extends InheritedWidget {
  final _SettingsBindingState settingsBindingState;
  const _SettingsBindingScope({
    Key? key,
    required this.settingsBindingState,
    required Widget child,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;
}
