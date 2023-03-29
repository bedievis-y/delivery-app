import 'package:delivery_app/models/food_model.dart';
import 'package:flutter/material.dart';
import 'package:delivery_app/utils/constants/color.dart';
import 'package:delivery_app/presentation/widget/custom_app_bar.dart';
import 'dart:math' as math;

class DetailsPage extends StatefulWidget {
  final Food food;
  const DetailsPage({Key? key, required this.food}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: CustomAppBar(
                btnIcon1: 'arrow.png',
                btnIcon2: 'more.png',
                btnFun1: () {
                  Navigator.pop(context);
                },
                btnFun2: () {},
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: RichText(
                text: TextSpan(children: [
                  TextSpan(
                    text: widget.food.name,
                    style: const TextStyle(
                      fontSize: 30.0,
                      color: brown,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: '\n${widget.food.withs}',
                    style: const TextStyle(
                      fontSize: 18.0,
                      color: brown,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ]),
              ),
            ),
            const SizedBox(height: 30.0),
            Expanded(
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    left: 0,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10.0,
                        vertical: 30.0,
                      ),
                      height: 180.0,
                      decoration: const BoxDecoration(
                        color: brown,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(40.0),
                          bottomRight: Radius.circular(40.0),
                          topLeft: Radius.circular(40.0),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Kkal:',
                            style: TextStyle(
                              fontSize: 14.0,
                              color: white,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            widget.food.kal,
                            style: const TextStyle(
                              fontSize: 16.0,
                              color: white,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          const SizedBox(height: 25),
                          const Text(
                            'Weight:',
                            style: TextStyle(
                              fontSize: 14.0,
                              color: white,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            widget.food.weight,
                            style: const TextStyle(
                              fontSize: 16.0,
                              color: white,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    left: 10,
                    child: Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.rotationY(math.pi),
                      child: Image.asset(
                        widget.food.image,
                        height: 360.0,
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 25.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Detail',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: black,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Text(
                    widget.food.description,
                    style: const TextStyle(
                      fontSize: 16.0,
                      color: black,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Total Price',
                            style: TextStyle(
                              fontSize: 16.0,
                              color: black,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(height: 5.0),
                          Text(
                            widget.food.price,
                            style: const TextStyle(
                              fontSize: 16.0,
                              color: black,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ],
                      ),
                      
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.favorite,
                          color: brown,
                          size: 30.0,
                        ),
                      ),
                      Container(
                        height: 40.0,
                        padding: const EdgeInsets.symmetric(horizontal: 30.0),
                        decoration: BoxDecoration(
                          color: brown,
                          borderRadius: BorderRadius.circular(40.0),
                        ),
                        child: Center(
                          child: Row(
                            children: const [
                              Text(
                                'Add to Cart',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color: white,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(width: 10.0),
                              Icon(
                                Icons.shopping_cart_outlined,
                                color: white,
                                size: 20.0,
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30.0),
          ],
        ),
      ),
    );
  }
}
