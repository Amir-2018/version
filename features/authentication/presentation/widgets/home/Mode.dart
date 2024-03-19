import 'package:flutter/material.dart';

class Mode extends StatelessWidget {
  const Mode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background container with white color (optional)
        Container(
          color: Color(0xFF1F7774), // Adjust color as needed
          constraints: const BoxConstraints.expand(),
        ),

        // Positioned container with 80% screen height, fixed at bottom
        Positioned(
          bottom: 0.0, // Pin the bottom to the edge of the Stack
          left: 0.0, // Pin the left to the edge of the Stack
          right: 0.0, // Pin the right to the edge of the Stack
          child: Container(
            height: MediaQuery.of(context).size.height * 0.9,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(50), topRight: Radius.circular(50)),
              color: Colors.white,

            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center, // Center vertically within the container
                children: [
                  SizedBox(
                    width: 250.0,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () => {
                        Navigator.pushNamed(context, '/home')
                      },
                      child: const Text('Utilisateur'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF1F7774),
                        foregroundColor: Colors.white,
                        textStyle: const TextStyle(fontSize: 16.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0), // Add spacing between buttons
                  SizedBox(
                    width: 250.0,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () => {
                      Navigator.pushNamed(context, '/login')
                    },
                      child: const Text('Responsable'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        foregroundColor: Colors.white,
                        textStyle: const TextStyle(fontSize: 16.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );

  }
}
