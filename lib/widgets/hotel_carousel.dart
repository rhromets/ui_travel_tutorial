import 'package:flutter/material.dart';
import 'package:ui_travel_tutorial/helpers/build_carousel_card.dart';
import 'package:ui_travel_tutorial/models/hotel_model.dart';
import 'package:ui_travel_tutorial/widgets/widgets.dart';

class HotelCarousel extends StatelessWidget {
  const HotelCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: HomeTitle(
            titleText: 'Exclusive Hotels',
            detailText: 'See all',
          ),
        ),
        SizedBox(
          height: 314,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: hotels.length,
            itemBuilder: (context, index) {
              Hotel hotel = hotels[index];
              return buildCarouselCard(
                  cardContainerWidth: 240,
                  stackContainerWidth: 240,
                  isTitleAlignmentCenter: true,
                  titleText: hotel.name,
                  smallText: hotel.address,
                  priceText: '\$${hotel.price} / night',
                  isHotelCarousel: true,
                  hotelImgPath: hotel.imageUrl
              );
            },
          ),
        ),
      ],
    );
  }
}
