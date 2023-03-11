import 'package:flutter/material.dart';

import '../Widgets/containerTab.dart';

class MacroniT extends StatelessWidget {
  const MacroniT({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Row(
          children: [
            ContainerTab(),
            ContainerTab(),
            ContainerTab(),
            ContainerTab(),
          ],
        ),
        Row(
          children: [
            ContainerTab(),
            ContainerTab(),
            ContainerTab(),
            ContainerTab(),
          ],
        ),
      ],
    );
  }
}
