import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'local.dart';
import 'product_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'lib2/form_ui.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(EasyLocalization(
    supportedLocales: [Locale('en'),Locale('ar')],
    fallbackLocale: Locale('en'),
    path: 'assets/langs',
    child: Localization(),
  ));
}

class FirstScreen extends StatefulWidget {

  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen>
    with TickerProviderStateMixin {
  List<Product> productsList;
  List<Product> likedProduct = [];
  int _currentIndex = 0;
  TabController _controller;

  @override
  void initState() {
    super.initState();
    productsList = Product.getProductList();
    _controller = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('First Project'),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (int index) {
            setState(() {
              _currentIndex = index;
              _controller.animateTo(_currentIndex);
            });
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite), label: 'favourite'),
          ],
        ),
        body: TabBarView(
          controller: _controller,
          children: [
            buildProductsList(productsList),
            buildProductsList(likedProduct),
          ],
        ));
  }

  Widget buildProductsList(List<Product> products) {
    return ListView.builder(
      itemBuilder: (ctx, index) => Card(
        elevation: 8,
        margin: EdgeInsets.fromLTRB(8, 8, 0, 8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: ListTile(
            leading: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    image: AssetImage(
                      products[index].image,
                    ),
                    fit: BoxFit.cover,
                  )),
              height: 50,
              width: 50,
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  products[index].title,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(products[index].subTitle),
                Text('\$${products[index].price}'),
              ],
            ),
            trailing: IconButton(
              icon: Icon(
                Icons.thumb_up_rounded,
                color: products[index].isLiked ? Colors.red : Colors.grey,
              ),
              onPressed: () {
                setState(() {
                  products[index].isLiked = !products[index].isLiked;
                  products[index].isLiked
                      ? putItemFavourite(products[index].id)
                      : deleteItem(products[index].id);
                });
              },
            ),
          ),
        ),
      ),
      itemCount: products.length,
    );
  }

  void putItemFavourite(String itemId) {
    Product _product =
        productsList.firstWhere((product) => product.id == itemId);
    likedProduct.add(_product);
  }

  void deleteItem(String itemId) {
    likedProduct.removeWhere((product) => product.id == itemId);
  }
}
