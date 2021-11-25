import 'package:dnews/models/custom_widgets.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('d News' , style: TextStyle(color: Colors.blue[700]),),
          centerTitle: true,
          backgroundColor: Colors.white,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            MainCard(
              imageUrl: "https://images.pexels.com/photos/3621104/pexels-photo-3621104.jpeg?crop=entropy&cs=srgb&dl=pexels-rfstudio-3621104.jpg&fit=crop&fm=jpg&h=1280&w=1920",
              label: 'Sports',
              category: 'sports',
            ),
            MainCard(
              imageUrl: "https://images.pexels.com/photos/47344/dollar-currency-money-us-dollar-47344.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
              label: 'Business',
              category: 'business',
            ),
            MainCard(
              imageUrl: "https://images.pexels.com/photos/1587927/pexels-photo-1587927.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
              label: 'Entertainment',
              category: 'entertainment',
            ),
            MainCard(
              imageUrl: "https://images.pexels.com/photos/4682187/pexels-photo-4682187.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
              label: 'Technology',
              category: 'technology',
            ),
            MainCard(
              imageUrl: "https://images.pexels.com/photos/1424538/pexels-photo-1424538.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
              label: 'Health',
              category: 'health',
            ),
          ],
        ));
  }
}