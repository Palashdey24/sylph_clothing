import 'package:flutter/material.dart';

class CredinatialsDivider extends StatelessWidget {
  const CredinatialsDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const Expanded(
            child: Divider(
          color: Colors.blueGrey,
          thickness: 3,
        )),
        Text(
          " OR ",
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(fontWeight: FontWeight.bold),
        ),
        const Expanded(
          child: Divider(
            color: Colors.blueGrey,
            thickness: 3,
          ),
        ),
      ],
    );
  }
}
