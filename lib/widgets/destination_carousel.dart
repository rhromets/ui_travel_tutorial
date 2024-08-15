import 'package:flutter/material.dart';
import 'package:ui_travel_tutorial/helpers/build_carousel_card.dart';
import 'package:ui_travel_tutorial/models/destination_model.dart';
import 'package:ui_travel_tutorial/screens/destination_screen.dart';
import 'package:ui_travel_tutorial/widgets/widgets.dart';

class DestinationCarousel extends StatelessWidget {
  const DestinationCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: HomeTitle(
            titleText: 'Top Destinations',
            detailText: 'See all',
          ),
        ),
        SizedBox(
          height: 300,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: destinations.length,
            itemBuilder: (context, index) {
              Destination destination = destinations[index];
              return GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) {
                      return DestinationScreen(
                        destination: destination,
                      );
                    },
                  ),
                ),
                child: buildCarouselCard(
                  destination: destination,
                  cardContainerWidth: 210,
                  stackContainerWidth: 200,
                  isTitleAlignmentCenter: false,
                  titleText: '${destination.activities!.length} activities',
                  smallText: destination.description,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
