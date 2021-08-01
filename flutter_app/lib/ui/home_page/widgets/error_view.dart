import 'package:flutter/material.dart';

class ErrorView extends StatelessWidget {
  const ErrorView({
    Key? key,
    this.onPressedTyAgain,
  }) : super(key: key);

  final VoidCallback? onPressedTyAgain;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Opps, error loading users 😔'),
            TextButton(
              onPressed: onPressedTyAgain,
              child: Text('Try again'.toUpperCase()),
            ),
          ],
        ),
      ),
    );
  }
}
