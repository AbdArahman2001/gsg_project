import 'package:flutter/cupertino.dart';

class Product {
  final String id = DateTime.now().toString();
  bool isLiked = false;
  final String title;
  final String subTitle;
  final double price;
  final String image;

  Product(
      {
        @required this.title,
      @required this.subTitle,
      @required this.price,
      @required this.image});

 static List<Product> getProductList() {
    return <Product>[
      Product(
          title: 'product 1',
          subTitle: 'sub title for product 1',
          price: 100.0,
          image: 'assets/images/image1.jpg'),
      Product(
          title: 'product 2',
          subTitle: 'sub title for product 2',
          price: 520.0,
          image: 'assets/images/image2.jpg'),
      Product(
          title: 'product 3',
          subTitle: 'sub title for product 3',
          price: 100.0,
          image: 'assets/images/image3.jpg'),
      Product(
          title: 'product 4',
          subTitle: 'sub title for product 4',
          price: 100.0,
          image: 'assets/images/image4.jpg'),
      Product(
          title: 'product 5',
          subTitle: 'sub title for product 5',
          price: 100.0,
          image: 'assets/images/image5.jpg'),
      Product(
          title: 'product 6',
          subTitle: 'sub title for product 6',
          price: 100.0,
          image: 'assets/images/image6.jpg'),
      Product(
          title: 'product 7',
          subTitle: 'sub title for product 7',
          price: 100.0,
          image: 'assets/images/image7.jpg'),
      Product(
          title: 'product 8',
          subTitle: 'sub title for product 8',
          price: 100.0,
          image: 'assets/images/image8.jpg'),
    ];
  }
}
