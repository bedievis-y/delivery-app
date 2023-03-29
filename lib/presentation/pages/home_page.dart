import 'package:carousel_slider/carousel_slider.dart';
import 'package:delivery_app/data/data.dart';
import 'package:delivery_app/utils/constants/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:delivery_app/presentation/pages/details_page.dart';
import 'package:delivery_app/presentation/widget/custom_app_bar.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class HomePage extends StatelessWidget {
  HomePage({
    Key? key,
  }) : super(key: key);

  int selectIndex = 0;

  final List<String> imgList = [
    'assets/image/ad-1.jpg',
    'assets/image/ad-2.jpg',
    'assets/image/ad-3.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomAppBar(
                      btnIcon1: 'menu.png',
                      btnFun1: () {
                        ZoomDrawer.of(context)!.toggle();
                      },
                      btnIcon2: 'search.png',
                      btnFun2: () {},
                    ),
                    const SizedBox(height: 20.0),
                    CarouselSlider(
                      items: imgList
                          .map((item) => Center(
                            child: Image.asset(
                              item,
                              fit: BoxFit.cover,
                              width: 1000,
                            ),
                          ))
                          .toList(),
                      options: CarouselOptions(
                        autoPlay: true,
                        aspectRatio: 2.0,
                        enlargeCenterPage: true,
                      ),
                    ),                    
                    const SizedBox(height: 30.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'Categories',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'See All',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30.0),
                    CategoryItemsWidget(selectIndex: selectIndex),
                    const SizedBox(height: 30.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'Recommendations',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'See All',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20.0),
                  ],
                ),
              ),
              ConstrainedBox(
                constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height / 2.5),
                child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.only(bottom: 25.0, left: 20.0),
                    scrollDirection: Axis.horizontal,
                    itemCount: foods.length,
                    shrinkWrap: true,
                    itemBuilder: (itemBuilder, index) {
                      final food = foods[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (builder) => DetailsPage(food: food)));
                        },
                        child: Stack(
                          children: [
                            Positioned(
                              top: 150,
                              child: Container(
                                height: 100.0,
                                width: 185.0,
                                margin: const EdgeInsets.only(right: 10.0),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0,
                                  vertical: 15.0,
                                ),
                                decoration: BoxDecoration(
                                  color: index % 2 == 0 ? brown : gray,
                                  borderRadius: BorderRadius.circular(20.0),
                                  boxShadow: [
                                    BoxShadow(
                                      color: brown.withOpacity(0.20),
                                      blurRadius: 3,
                                      blurStyle: BlurStyle.outer,
                                      offset: const Offset(0, 1), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      food.title,
                                      maxLines: 2,
                                      style: TextStyle(
                                        fontSize: 15.0,
                                        color: index % 2 == 0 ? white : black,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    const SizedBox(height: 10.0),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          food.price,
                                          style: TextStyle(
                                            fontSize: 16.0,
                                            color: index % 2 == 0 ? white : black,
                                            fontWeight: FontWeight.w900,
                                          ),
                                        ),
                                        index == 1
                                            ? const Icon(
                                                Icons.favorite,
                                                color: Colors.red,
                                                size: 20.0,
                                              )
                                            : Icon(
                                                Icons.favorite_border,
                                                color: index % 2 == 0 ? gray : brown,
                                                size: 20.0,
                                              )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Image.asset(
                              food.image,
                              height: 150.0,
                            )
                          ],
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CategoryItemsWidget extends StatefulWidget {
  CategoryItemsWidget({Key? key, required this.selectIndex}) : super(key: key);
  int selectIndex;

  @override
  State<CategoryItemsWidget> createState() => _CategoryItemsWidgetState();
}

class _CategoryItemsWidgetState extends State<CategoryItemsWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150.0,
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.only(bottom: 25.0),
          scrollDirection: Axis.horizontal,
          itemCount: foods.length,
          shrinkWrap: true,
          itemBuilder: (itemBuilder, index) {
            return GestureDetector(
              onTap: () {
                setState(() => widget.selectIndex = index);
              },
              child: Container(
                height: 50.0,
                width: 150.0,
                margin: const EdgeInsets.only(bottom: 10.0, right: 15.0),
                decoration: BoxDecoration(
                  color: widget.selectIndex == index ? brown : gray,
                  borderRadius: BorderRadius.circular(20.0),
                  boxShadow: [
                    BoxShadow(
                      color: brown.withOpacity(0.20),
                      blurRadius: 3,
                      blurStyle: BlurStyle.outer,
                      offset: const Offset(0, 1),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(
                      categories[index].image,
                      height: 30.0,
                      width: 30.0,
                      color: widget.selectIndex == index ? white : black,
                    ),
                    const SizedBox(height: 10.0),
                    Text(
                      categories[index].name,
                      style: TextStyle(
                        fontSize: 16.0,
                        color: widget.selectIndex == index ? white : black,
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
