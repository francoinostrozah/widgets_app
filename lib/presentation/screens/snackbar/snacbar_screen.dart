import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {
  static const name = 'snackbar_screen';

  const SnackbarScreen({super.key});

  void showCustomSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();

    final snackbar = SnackBar(
      content: const Text('Hola Mundo'),
      action: SnackBarAction(
        label: 'Ok!',
        onPressed: () {},
      ),
      duration: const Duration(seconds: 2),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  void openDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('¿Estás Seguro?'),
        content: const Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut mattis ante suscipit orci ornare bibendum. Nunc vitae luctus sem. Donec in laoreet mi, vel aliquam nibh. Morbi libero ex, interdum vel viverra non, pretium a ante. Fusce et tortor non ipsum aliquam rhoncus. Curabitur at turpis venenatis, fringilla metus ac, pharetra neque. Nam aliquam, justo in accumsan dictum, lectus neque dignissim lorem, vel dapibus magna purus eu risus. Ut varius leo a turpis rutrum, et fermentum tortor mollis. Vestibulum in magna non elit lobortis scelerisque. Maecenas fringilla efficitur erat, a convallis nisl feugiat at.'),
        actions: [
          TextButton(
            onPressed: () => context.pop(),
            child: const Text('Cancelar'),
          ),
          FilledButton(
              onPressed: () => context.pop(), child: const Text('Aceptar'))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Snackbars y Diálogos')),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => showCustomSnackBar(context),
        label: const Text('Mostrar Snackbar'),
        icon: const Icon(Icons.remove_red_eye_outlined),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FilledButton.tonal(
              onPressed: () {
                showAboutDialog(context: context, children: [
                  const Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut mattis ante suscipit orci ornare bibendum. Nunc vitae luctus sem. Donec in laoreet mi, vel aliquam nibh. Morbi libero ex, interdum vel viverra non, pretium a ante. Fusce et tortor non ipsum aliquam rhoncus. Curabitur at turpis venenatis, fringilla metus ac, pharetra neque. Nam aliquam, justo in accumsan dictum, lectus neque dignissim lorem, vel dapibus magna purus eu risus. Ut varius leo a turpis rutrum, et fermentum tortor mollis. Vestibulum in magna non elit lobortis scelerisque. Maecenas fringilla efficitur erat, a convallis nisl feugiat at.')
                ]);
              },
              child: const Text('Licencias usadas')),
          FilledButton.tonal(
            onPressed: () => openDialog(context),
            child: const Text('Mostrar díalogo'),
          ),
        ],
      )),
    );
  }
}
