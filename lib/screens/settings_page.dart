import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  final bool isDarkMode;
  final Function(bool) onThemeChanged;

  const SettingsPage({
    Key? key,
    required this.isDarkMode,
    required this.onThemeChanged,
  }) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  late bool _isDarkModeLocal;
  bool notificationsEnabled = true;

  @override
  void initState() {
    super.initState();
    _isDarkModeLocal = widget.isDarkMode;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ayarlar"),
      ),
      body: ListView(
        children: [
          SwitchListTile(
            title: const Text("Koyu Tema"),
            subtitle: const Text("Koyu/aydın tema arasında geçiş yapın."),
            value: _isDarkModeLocal,
            onChanged: (bool value) {
              setState(() {
                _isDarkModeLocal = value;
              });
              widget.onThemeChanged(value);
            },
          ),
        ],
      ),
    );
  }
}
