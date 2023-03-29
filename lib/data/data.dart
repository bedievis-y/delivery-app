import 'package:delivery_app/models/categories_model.dart';
import 'package:delivery_app/models/food_model.dart';
import 'package:delivery_app/models/menu_item_model.dart';
import 'package:flutter/material.dart';

List<Categories> categories = [
  Categories(id: 0, name: 'Fast Food', image: 'assets/icons/fast-food.svg'),
  Categories(id: 1, name: 'Soup', image: 'assets/icons/soup.svg'),
  Categories(id: 2, name: 'Bread', image: 'assets/icons/bread.svg'),
  Categories(id: 3, name: 'Salad', image: 'assets/icons/salad.svg'),
];

List<Food> foods = [
  Food(
    id: 0,
    name: 'Salad Caesar',
    title:
        'The classic Caesar recipe is Romano lettuce, slices of toasted bread, grated Parmesan cheese and a special dressing of egg yolks, Italian butter, Worcestershire sauce, garlic and lemon juice. Professional chefs and skilled housewives use their own variants of dishes, adding ingredients to their liking.',
    withs: 'with chiken',
    image: 'assets/image/01.png',
    price: '\$9',
    weight: '170g',
    description: 'Order through the app and get a 50% discount',
    kal: '110',
  ),
  Food(
    id: 0,
    name: 'Soup borscht',
    title: 'Borscht - A hot, beetroot-based dressing soup that gives it its characteristic red color.',
    withs: 'with tender meat',
    image: 'assets/image/05.png',
    price: '\$14',
    weight: '200g',
    description: 'Order through the app and get a 50% discount',
    kal: '80',
  ),
  Food(
    id: 0,
    name: 'Club sandwich',
    title:
        'Bread sandwich (usually toasted), with sliced ​​cooked poultry, ham or fried bacon, lettuce, tomato, and mayonnaise',
    withs: 'with poultry meat',
    image: 'assets/image/02.png',
    price: '\$16',
    weight: '190g',
    description: 'Order through the app and get a 50% discount',
    kal: '100',
  ),
  Food(
    id: 0,
    name: 'Potatoes at home',
    title: 'Fried until golden brown and potato onions with the addition of bon fillet, sprinkled with green onions.',
    withs: 'with tender meat',
    image: 'assets/image/04.png',
    price: '\$19',
    weight: '190g',
    description: 'Get 50% discount on the cooked veg with sweet cookies and stay connected for further discounts',
    kal: '150',
  ),

];

List<MenuItem> menuItem = [
  const MenuItem(icon: Icons.history, title: 'History'),
  const MenuItem(icon: Icons.monetization_on_outlined, title: 'Cashback'),
  const MenuItem(icon: Icons.notifications_active_outlined, title: 'Notification'),
  const MenuItem(icon: Icons.help_outline, title: 'Help'),
  const MenuItem(icon: Icons.info_outline, title: 'About Us'),
  const MenuItem(icon: Icons.star_border, title: 'Rate Us'),
];
