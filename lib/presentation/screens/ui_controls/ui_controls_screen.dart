import 'package:flutter/material.dart';

class UiControlsScreen extends StatelessWidget {
  static const name = 'ui_controls_screen';

  const UiControlsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('UI Controls')),
      body: const _UiControlsView(),
    );
  }
}

class _UiControlsView extends StatefulWidget {
  const _UiControlsView();

  @override
  State<_UiControlsView> createState() => _UiControlsViewState();
}

enum Transportation { car, plane, boat, sumarine }

class _UiControlsViewState extends State<_UiControlsView> {
  bool isDeveloper = true;
  Transportation selectedTransportation = Transportation.car;

  bool wantsBreakfast = false;
  bool wantsLunch = false;
  bool wantsDinner = false;

  @override
  Widget build(BuildContext context) {
    return ListView(physics: const ClampingScrollPhysics(), children: [
      SwitchListTile(
          title: const Text('Developer Mode'),
          subtitle: const Text('Controles adicionales'),
          value: isDeveloper,
          onChanged: (value) => setState(() {
                isDeveloper = !isDeveloper;
              })),
      ExpansionTile(
        title: const Text('Transport Vehicle'),
        subtitle: Text(selectedTransportation.name),
        children: [
          ...Transportation.values.map((transportation) => RadioListTile(
              title: Text('By ${transportation.name}'),
              subtitle: Text('Travel by ${transportation.name}'),
              value: transportation,
              groupValue: selectedTransportation,
              onChanged: (value) => setState(() {
                    selectedTransportation = transportation;
                  }))),
        ],
      ),
      ExpansionTile(
        title: const Text('Comidas'),
        subtitle: const Text('Elección de comidas'),
        children: [
          CheckboxListTile(
              title: const Text('¿Desayuno?'),
              value: wantsBreakfast,
              onChanged: (value) => setState(() {
                    wantsBreakfast = !wantsBreakfast;
                  })),
          CheckboxListTile(
              title: const Text('¿Almuerzo?'),
              value: wantsLunch,
              onChanged: (value) => setState(() {
                    wantsLunch = !wantsLunch;
                  })),
          CheckboxListTile(
              title: const Text('Cena?'),
              value: wantsDinner,
              onChanged: (value) => setState(() {
                    wantsDinner = !wantsDinner;
                  }))
        ],
      )
    ]);
  }
}
