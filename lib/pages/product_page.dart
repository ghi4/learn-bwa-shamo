import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shamo/theme.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    List images = [
      'assets/images/image_shoes.png',
      'assets/images/image_shoes.png',
      'assets/images/image_shoes.png',
    ];

    Widget indicator(int index) {
      var isSelected = currentIndex == index;
      return Container(
        height: 4,
        width: isSelected ? 16 : 4,
        margin: const EdgeInsets.symmetric(horizontal: 2),
        decoration: BoxDecoration(
          color: isSelected ? primaryColor : const Color(0xffC4C4C4),
          borderRadius: BorderRadius.circular(12),
        ),
      );
    }

    Widget header() {
      int index = -1;

      return Column(
        children: [
          // AppBar
          Container(
            margin: EdgeInsets.only(
              top: 20,
              left: defaultMargin,
              right: defaultMargin,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkResponse(
                  child: const Icon(
                    Icons.chevron_left,
                  ),
                  onTap: () {},
                ),
                InkResponse(
                  child: Icon(
                    Icons.shopping_bag,
                    color: backgroundColor1,
                  ),
                  onTap: () {},
                ),
              ],
            ),
          ),

          // Image Slider
          CarouselSlider(
            items: images
                .map(
                  (image) => Image.asset(
                    image,
                    width: MediaQuery.of(context).size.width,
                    height: 310,
                    fit: BoxFit.cover,
                  ),
                )
                .toList(),
            options: CarouselOptions(
              onPageChanged: (index, reason) {
                setState(() {
                  currentIndex = index;
                });
              },
            ),
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: images.map((e) {
                index++;
                return indicator(index);
              }).toList()),
        ],
      );
    }

    return Scaffold(
      body: ListView(
        children: [
          header(),
        ],
      ),
    );
  }
}
