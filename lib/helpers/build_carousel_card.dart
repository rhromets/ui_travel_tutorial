import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ui_travel_tutorial/models/destination_model.dart';

Container buildCarouselCard({
  Destination? destination,
  double? cardContainerWidth,
  double? stackContainerWidth,
  bool isTitleAlignmentCenter = true,
  bool isHotelCarousel = false,
  String titleText = '',
  String smallText = '',
  String priceText = '',
  String hotelImgPath = '',
}) {
  return Container(
    margin: const EdgeInsets.all(10),
    width: cardContainerWidth,
    child: Stack(
      alignment: Alignment.topCenter,
      children: [
        Positioned(
          bottom: 15,
          child: Container(
            height: 120,
            width: stackContainerWidth,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: isTitleAlignmentCenter
                    ? CrossAxisAlignment.center
                    : CrossAxisAlignment.start,
                children: [
                  Text(
                    titleText,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.2,
                    ),
                  ),
                  isHotelCarousel
                      ? const SizedBox(height: 2)
                      : const SizedBox(),
                  Text(
                    smallText,
                    maxLines: isHotelCarousel ? 1 : 2,
                    style: const TextStyle(
                      color: Colors.grey,
                      letterSpacing: 1,
                      fontSize: 12,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  isHotelCarousel
                      ? const SizedBox(height: 2)
                      : const SizedBox(),
                  isHotelCarousel
                      ? Text(
                          priceText,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      : const SizedBox(),
                ],
              ),
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                offset: Offset(0, 2),
                blurRadius: 6,
              ),
            ],
          ),
          child: isHotelCarousel
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image(
                    height: 180,
                    width: 220,
                    image: AssetImage(hotelImgPath),
                    fit: BoxFit.cover,
                  ),
                )
              : Stack(
                  children: [
                    Hero(
                      tag: destination!.imageUrl,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image(
                          height: 180,
                          width: 180,
                          image: AssetImage(destination.imageUrl.toString()),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 10,
                      bottom: 10,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            destination.city.toString(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1.2,
                            ),
                          ),
                          Row(
                            children: [
                              const Icon(
                                FontAwesomeIcons.locationArrow,
                                size: 10,
                                color: Colors.white,
                              ),
                              const SizedBox(width: 5),
                              Text(
                                destination.country,
                                style: const TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
        ),
      ],
    ),
  );
}
