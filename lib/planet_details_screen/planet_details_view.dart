import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';
import 'package:space/core/constants/app_colors.dart';
import 'package:space/core/constants/app_text_style.dart';
import 'package:space/data/models/planets_model.dart';

class PlanetDetailsView extends StatelessWidget {
  const PlanetDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    final PlanetModel planet =
        ModalRoute.of(context)!.settings.arguments as PlanetModel;

    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(context, planet),

            const SizedBox(height: 20),

            _build3DViewer(planet),

            const SizedBox(height: 20),

            Text("About", style: AppTextStyle.detailstext),

            const SizedBox(height: 8),

            Text(planet.about ?? ""),

            const SizedBox(height: 20),

            _buildPlanetInfo(planet),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context, PlanetModel planet) {
    return Stack(
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
                colors: [
                  Colors.transparent,
                  AppColors.blackcolor,
                ],
              ),
            ),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  children: [
                    Text(
                      planet.planetName ?? "",
                      style: AppTextStyle.detailstext,
                    ),
                    const Spacer(),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        planet.title ?? "",
                        style: AppTextStyle.detailstext,
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          ),
        ),

        Positioned(
          top: 30,
          left: 20,
          child: IconButton(
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(AppColors.primary),
            ),
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
        ),
      ],
    );
  }

  Widget _build3DViewer(PlanetModel planet) {
    return SizedBox(
      height: 380,
      width: double.infinity,
      child: ModelViewer(
        backgroundColor: Colors.transparent,
        src: planet.threeDModel ?? "",
        alt: "3D Planet Model",
        ar: true,
        autoRotate: true,
        cameraControls: true,
        disableZoom: true,
      ),
    );
  }

  Widget _buildPlanetInfo(PlanetModel planet) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _infoItem("Distance from sun", planet.distanceFromSun),
        _infoItem("Length of day", planet.lengthOfDay),
        _infoItem("Orbital period", planet.orbitalPeriod),
        _infoItem("Radius", planet.radius),
        _infoItem("Mass", planet.mass),
        _infoItem("Gravity", planet.gravity),
        _infoItem("Surface area", planet.surfaceArea),
      ],
    );
  }

  Widget _infoItem(String title, dynamic value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Text(
        "$title: ${value ?? ""}",
        style: AppTextStyle.detailstext,
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:model_viewer_plus/model_viewer_plus.dart';
// import 'package:space/core/constants/app_colors.dart';
// import 'package:space/core/constants/app_text_style.dart';
// import 'package:space/data/models/planets_model.dart';

// class PlanetDetailsView extends StatelessWidget {
//   const PlanetDetailsView({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     var arguments = ModalRoute.of(context)!.settings.arguments as PlanetModel;
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Column(
//             children: [
//               Stack(
//                 children: [
//                   Image.asset(
//                     "assets/images/frame2.png",
//                     fit: BoxFit.cover,
//                     width: double.infinity,
//                   ),

//                   Positioned.fill(
//                     child: Container(
//                       decoration: BoxDecoration(
//                         gradient: LinearGradient(
//                           begin: Alignment.topCenter,
//                           end: Alignment.bottomCenter,
//                           colors: [Colors.transparent, AppColors.blackcolor],
//                         ),
//                       ),
//                       child: SafeArea(
//                         child: Column(
//                           children: [
//                             Text(
//                               arguments.planetName!,
//                               style: AppTextStyle.detailstext,
//                             ),
//                             const Spacer(),
//                             Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.start,
//                                 children: [
//                                   FittedBox(
//                                     child: Text(
//                                       arguments.title!,
//                                       style: AppTextStyle.detailstext,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                   Positioned(
//                     top: 30,
//                     left: 20,
//                     child: IconButton(
//                       style: ButtonStyle(
//                         backgroundColor: WidgetStateProperty.all(
//                           AppColors.primary,
//                         ),
//                       ),
//                       icon: Icon(Icons.arrow_back, color: Colors.white),
//                       onPressed: () {
//                         Navigator.pop(context);
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(
//                 height: 400,
//                 child: ModelViewer(
//                   backgroundColor: Colors.transparent,
//                   src: arguments.threeDModel!,
//                   alt: 'A 3D model of an astronaut',
//                   ar: true,
//                   autoRotate: true,
                
//                   disableZoom: true,
//                 ),
//               ),

//               Row(children: [Text('About', style: AppTextStyle.detailstext)]),
//               Text(arguments.about!),
//               Text('\n'),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Row(),
//                   Text(
//                     'Distance from sun: ${arguments.distanceFromSun!.toString()}',
//                     style: AppTextStyle.detailstext,
//                   ),
//                   Text(
//                     'Length of day: ${arguments.lengthOfDay!.toString()}',
//                     style: AppTextStyle.detailstext,
//                   ),
//                   Text(
//                     'Orbital period: ${arguments.orbitalPeriod!.toString()}',
//                     style: AppTextStyle.detailstext,
//                   ),
//                   Text(
//                     'Radius: ${arguments.radius!.toString()}',
//                     style: AppTextStyle.detailstext,
//                   ),
//                   Text(
//                     'Mass: ${arguments.mass!.toString()}',
//                     style: AppTextStyle.detailstext,
//                   ),
//                   Text(
//                     'Gravity: ${arguments.gravity!.toString()}',
//                     style: AppTextStyle.detailstext,
//                   ),
//                   Text(
//                     'Surface area: ${arguments.surfaceArea!.toString()}',
//                     style: AppTextStyle.detailstext,
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
