import 'package:flutter/material.dart';
import 'package:keyboard_shortcut_listener/main.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: KeyboardShortcutDemo(),
    );
  }
}

class KeyboardShortcutDemo extends StatelessWidget with ShortcutMixin {
  final FocusNode field1FocusNode = FocusNode();
  final FocusNode field2FocusNode = FocusNode();
  final FocusNode field3FocusNode = FocusNode();

  KeyboardShortcutDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Keyboard Shortcut Demo')),
      body: withShortcuts(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(height: 20),
              CustomForm(
                focusNode: field1FocusNode,
                text: "&Field 1",
              ),
              const SizedBox(height: 20),
              CustomForm(
                focusNode: field2FocusNode,
                text: "Fiel&d 2",
              ),
              const SizedBox(height: 20),
              CustomForm(
                focusNode: field3FocusNode,
                text: "Field &3",
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  //print("Heloooo");
                },
                child: LinedText(
                  text: '&A Button',
                  onShortcutTriggered: () =>
                      _showSnackBar(context, 'Button A Pressed'),
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {},
                child: LinedText(
                  text: 'B But&ton',
                  onShortcutTriggered: () =>
                      _showSnackBar(context, 'Button B Pressed'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
}

class CustomForm extends StatelessWidget {
  final FocusNode focusNode;
  final String text;

  const CustomForm({
    super.key,
    required this.focusNode,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: focusNode,
      decoration: InputDecoration(
          label: LinedText(
        //style: TextStyle(color: Colors.deepOrange),
        text: text,
        onShortcutTriggered: () => focusNode.requestFocus(),
      )),
    );
  }
}
