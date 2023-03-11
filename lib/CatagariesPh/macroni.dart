import 'package:flutter/material.dart';

import '../Widgets/containerPh.dart';

class Macroni extends StatelessWidget {
  const Macroni({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [ContainerPh(), ContainerPh()],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [ContainerPh(), ContainerPh()],
            ),
          ),
        ],
      ),
    );
  }
}
