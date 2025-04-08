import 'package:flutter/material.dart';
import 'package:project/features/Auth/presentation/widgets/custombuttom.dart';
import 'package:project/features/home/presentation/views/search_view.dart';

class NoWeatherInfoBody extends StatelessWidget {
  const NoWeatherInfoBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(
            'assets/images/weather.jpg',
            height: 200,
            fit: BoxFit.contain,
          ),
          const SizedBox(height: 20),

          const Center(
            child: Text(
              'No Weather Data Yet 😔',
              style: TextStyle(
                fontFamily: 'Pacifico',
                fontSize: 32,
                color: Colors.white,
                shadows: [
                  Shadow(
                    color: Colors.black26,
                    offset: Offset(2, 2),
                    blurRadius: 4,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          // النص التاني
          const Center(
            child: Text(
              'Start Searching Now!',
              style: TextStyle(
                fontFamily: 'Pacifico',
                fontSize: 24,
                color: Colors.white70,
              ),
            ),
          ),
          const SizedBox(height: 30),
          // زرار "Search Now"
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
                width: 200,
                height: 50,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFFFFA726), // برتقالي
                      Color(0xFFFF5722), // برتقالي غامق
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0, 4),
                      blurRadius: 8,
                    ),
                  ],
                ),
                child: CustomButtom(
                  buttomname: 'Search Now',
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return SearchView();
                    }));
                  },
                )

                //  MaterialButton(
                //   onPressed: () {
                //     Navigator.push(context, MaterialPageRoute(builder: (context) {
                //       return SearchView();
                //     }));
                //   },
                //   child: const Text(
                //     'Search Now',
                //     style: TextStyle(
                //       color: Colors.white,
                //       fontSize: 18,
                //       fontWeight: FontWeight.bold,
                //     ),
                //   ),
                // ),
                ),
          ),
        ],
      ),
    );
  }
}
