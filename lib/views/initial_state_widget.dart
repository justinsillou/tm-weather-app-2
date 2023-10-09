import 'package:flutter/material.dart';

class InitialStateWidget extends StatelessWidget {
  const InitialStateWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // display button to load data
      color: Colors.white,
      child: Center(
        child: ElevatedButton(
          onPressed: () {
            // set state to loading

            // load data
          },
          child: const Text('Load Data'),
        ),
      ),
    );
  }
}
