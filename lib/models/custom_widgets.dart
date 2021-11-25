import 'package:cached_network_image/cached_network_image.dart';
import 'package:dnews/view/screens/second_screen.dart';
import 'package:dnews/view_models/main_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainCard extends StatelessWidget {
  final String? imageUrl;
  final String? label;
  final String? category;
  MainCard({this.category , this.imageUrl , this.label});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Center(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                ),
                height: 110,
                child: CachedNetworkImage(
                  fit: BoxFit.fitWidth,
                  imageUrl: imageUrl!,
                  placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0x7f1A2026),
                ),
                height: 110,
                width: double.infinity,
                child:  Center(
                  child: Text(label!),
                ),
              ),
            ),
          ],
        ),
      ),
      onTap: (){
        MainVM.selectedCategory = category;
        Get.to(()=>SecondScreen());
        // Navigator.push(context, MaterialPageRoute(builder: (context)=>SecondScreen(topSelected: category,)));
      },
    );
  }
}
