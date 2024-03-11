import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  List<Product> featuredProducts=[
    new Product(name: "tufi",imageUrl: "https://th.bing.com/th/id/OIP.d_YzL5iaa66seM5luZJIdAHaFj?w=225&h=180&c=7&r=0&o=5&pid=1.7",price: 20),
    new Product(name: "cupkake",imageUrl:"https://th.bing.com/th/id/OIP.Sx2nWXlHxa9ayFE_-F4CYQHaEo?rs=1&pid=ImgDetMain",price: 100),
     new Product(name: "tea",imageUrl: "https://th.bing.com/th/id/OIP.nfmQp4lyU7Un1wTeXGnybQHaEw?w=266&h=180&c=7&r=0&o=5&pid=1.7",price: 20),
     new Product(name: "pasta",imageUrl: "https://th.bing.com/th/id/OIP.q1lF1etFlrBbZT7wb-QL9gHaFW?w=271&h=196&c=7&r=0&o=5&pid=1.7",price: 20),
     new Product(name: "french meal",imageUrl: "https://th.bing.com/th/id/OIP.UNCQUhqtEFTrGUpQ5xoROQHaHa?w=196&h=196&c=7&r=0&o=5&pid=1.7 ",price: 20),
     new Product(name: "meata",imageUrl: "https://th.bing.com/th/id/OIP.mLg2psW5bI6LnmK9HB-byQHaE6?w=292&h=194&c=7&r=0&o=5&pid=1.7",price: 20),
     new Product(name: "drelmelon",imageUrl: "https://th.bing.com/th/id/OIP.2g-dT3nt55YRPRmOlkYxsQHaE8?w=272&h=181&c=7&r=0&o=5&pid=1.7 ",price: 20),
  ] ;

  List<String> categories=["Chicken","Meats","Seafood","frout","Pasta","Pizza","Vegetarian Dishes"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Resurent Store'),
        actions: [
          IconButton(
            icon:const Icon(Icons.search),
            onPressed: () {
              // Implement search functionality
            },
          ),
          IconButton(
            icon:const Icon(Icons.shopping_cart),
            onPressed: () {
              // Navigate to the shopping cart screen
            },
          ),
        ],
      ),
      body: ListView(
        children: [
          // Featured products section
          _buildSectionTitle('Featured Products'),
          _buildProductList(0), // Implement this method to display featured products

          // Categories section
          _buildSectionTitle('Categories'),
          _buildCategoryList(), // Impl
          SizedBox(height: 20,),
          _buildSectionTitle(' Products For you'),
          _buildProductList(featuredProducts.length-1), // Implement this method to display featured products

          // ement this method to display product categories
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
      child: Text(
        title,
        style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildProductList(int num) {
    int c=num;
    // Implement this method to display featured products
    return Container(
      height: 200.0,
      child:
      ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: featuredProducts.length,
        itemBuilder: (context, index) {
          int sum = index-c;
          sum.isNegative ? sum=sum*-1 :sum=sum ;
          return FeaturedProductCard(product: featuredProducts[sum]);
        },
      ),
    );
  }

  Widget _buildCategoryList( ) {

    // Implement this method to display product categories
    return Container(
      height: 100.0,
      // ListView or GridView of product categories
      // Example:
      child:ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return CategoryCard(category: categories[index]);
        },
      ),
    );
  }
}

// Example widget for displaying featured product
class FeaturedProductCard extends StatelessWidget {
  final Product product;

  FeaturedProductCard({required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150.0,
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            product.imageUrl,
            height: 100.0,
            width: 150.0,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 8.0),
          Text(product.name),
          Text('\$${product.price}'),
        ],
      ),
    );
  }
}

// Example model for product
class Product {
  final String name;
  final String imageUrl;
  final double price;

  Product({required this.name, required this.imageUrl, required this.price});
}

// Example widget for displaying product category
class CategoryCard extends StatelessWidget {
  final String category;

  CategoryCard({required this.category});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.0,
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Text(category),
    );
  }
}
