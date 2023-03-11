import 'package:flutter/material.dart';
import 'package:foodapp/Widgets/containerTab.dart';

class PastaT extends StatelessWidget {
  const PastaT({super.key});

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
