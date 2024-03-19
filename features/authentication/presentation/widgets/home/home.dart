import 'package:flutter/material.dart';

import '../subwidgets/button_navigation_bar.dart';
import 'build_box.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        title: Text('Six Boxes - Centered Wrap'),
      ),*/
      body: Column(
        // Ensure Column takes full screen height
        mainAxisSize: MainAxisSize.min, // Avoid unnecessary stretching
        mainAxisAlignment: MainAxisAlignment.center, // Center vertically
        children: [
          Expanded(
            flex: 11,
            child:  Center(
            child: Wrap(
              spacing: 30.0, // Space between boxes
              runSpacing: 10.0, // Space between rows
              children: [
                buildBox(color: Color(0xFF275A53), icon: Icons.map_outlined, title: 'Map'),
                buildBox(color: Color(0xFFDE5C48), icon: Icons.event_outlined, title: 'Evenements'),
                buildBox(color: Color(0xFFEAA929), icon: Icons.article_outlined, title: 'Annonces'),
                buildBox(color: Color(0xFF75CF9A), icon:Icons.car_crash, title: 'Covoiturage'),
                buildBox(color: Color(0xFFDE5C48), icon:Icons.store_outlined, title: 'Conventions'),
                buildBox(color: Color(0xFF4F6AFA), icon:Icons.dangerous_outlined, title: 'Reclamations'),
              ],
            ),
          ),),
          // Centered Wrap
          Expanded(
            flex: 1,
            child: ButtonNavigationBar(),)

        ],
      ),
    );
  }
}
