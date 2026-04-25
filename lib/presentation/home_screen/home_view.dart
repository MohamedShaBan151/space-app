import 'package:flutter/material.dart';
import 'package:space/core/confg/routes.dart';
import 'package:space/core/constants/app_colors.dart';
import 'package:space/core/constants/app_text_style.dart';
import 'package:space/core/constants/button.dart';
import 'package:space/data/models/planets_model.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late PageController controller;
  int _currentIndex = 3; // Start at Earth (index 3)

  @override
  void initState() {
    super.initState();
    controller = PageController(initialPage: _currentIndex);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currentPlanet = PlanetModel.planets[_currentIndex];

    return Scaffold(
      body: Column(
        children: [
          // Top Header with gradient
          Stack(
            children: [
              Image.asset(
                "assets/images/frame2.png",
                fit: BoxFit.cover,
                width: double.infinity,
              ),
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.transparent, AppColors.blackcolor],
                    ),
                  ),
                  child: SafeArea(
                    child: Column(
                      children: [
                        Text("Explore", style: AppTextStyle.explorettext),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "which planet\nwould you like to visit?",
                                style: AppTextStyle.explorettext,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),

          // Planet Image Carousel
          Expanded(
            child: PageView.builder(
              controller: controller,
              itemCount: PlanetModel.planets.length,
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              itemBuilder: (context, index) {
                final planet = PlanetModel.planets[index];
                return Image.asset(
                  planet.pngImage!,
                  fit: BoxFit.contain, // Better for planet images
                );
              },
            ),
          ),

          // Bottom Navigation Bar (Arrows + Planet Name)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            color: AppColors.blackcolor.withOpacity(0.95),
            child: Row(
              children: [
                IconButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(AppColors.primary),
                  ),
                  onPressed: () {
                    controller.previousPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  },
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                ),

                // Centered Planet Name
                Expanded(
                  child: Center(
                    child: Text(
                      currentPlanet.planetName ?? 'Unknown',
                      style: AppTextStyle.explorettext.copyWith(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),

                IconButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(AppColors.primary),
                  ),
                  onPressed: () {
                    controller.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  },
                  icon: const Icon(Icons.arrow_forward, color: Colors.white),
                ),
              ],
            ),
          ),
          MyButton(
            Title: 'Explore ${currentPlanet.planetName ?? 'Unknown'}',
            icon: Icons.arrow_forward,
            onPressed: () {
              Navigator.pushNamed(context, Routes.planetDetails,arguments: currentPlanet);
            },
          ),
        ],
      ),
    );
  }
}
