import 'package:flutter/material.dart';

class AppError extends StatelessWidget {
  final String errorText;
  const AppError({
    super.key,
    this.errorText = '',
  });

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: null != errorText && errorText.isNotEmpty,
      child: Container(
        alignment: Alignment.center,
        child: Text(
          errorText,
          style: const TextStyle(
            color: Colors.red,
            fontSize: 18.0,
          ),
        ),
      ),
    );
  }
}
