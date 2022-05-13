import 'package:flutter/material.dart';

class Settings {
  final ThemeMode? themeMode;

  const Settings._({this.themeMode = ThemeMode.system});

  static Settings of(BuildContext context) {
    final scope =
        context.dependOnInheritedWidgetOfExactType<_SettingsBindingScope>()!;
    return scope.settingsBindingState.currentSettings;
  }

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

  Settings copyWith({ThemeMode? themeMode}) => Settings._(
        themeMode: themeMode ?? this.themeMode,
      );

  @override
  bool operator ==(Object other) =>
      other is Settings && themeMode == other.themeMode;

  @override
  int get hashCode => Object.hashAll([themeMode]);

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
