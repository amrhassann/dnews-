import 'package:dnews/view/screens/web_view.dart';
import 'package:dnews/view_models/main_view_model.dart';
import 'package:flutter/material.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:get/get.dart';

class SecondScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GetBuilder<MainVM>(
        init: MainVM(),
        builder: (controller) => Scaffold(
          appBar: AppBar(
            title: Text(
              MainVM.selectedCategory! + ' news',
              style: TextStyle(color: Colors.blue[700]),
            ),
            centerTitle: true,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back_rounded,
                color: Colors.blue[700],
              ),
              onPressed: () {
                Get.back();
              },
            ),
            backgroundColor: Colors.white,
          ),
          body: Container(
            child: controller.loading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    controller: controller.scrollController,
                    itemCount: controller.articles.length + 1,
                    itemBuilder: (BuildContext context, int position) {
                      if (position == controller.articles.length) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      }
                      return InkWell(
                        onTap: (){
                          Get.to(()=>WebViewScreen(url: controller.articles[position].url,));
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 0),
                          child: Container(
                            decoration: new BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(.5),
                                  blurRadius: 20.0, // soften the shadow
                                  spreadRadius: 0.0, //extend the shadow
                                  offset: Offset(
                                    2.0, // Move to right 10  horizontally
                                    2.0, // Move to bottom 10 Vertically
                                  ),
                                )
                              ],
                            ),
                            child: Card(
                              color: Colors.white,
                              shadowColor: Colors.transparent,
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          Row(
                                            children: [
                                              CircleAvatar(
                                                backgroundImage: NetworkImage(
                                                    'https://previews.123rf.com/images/jabkitticha/jabkitticha1702/jabkitticha170200059/72834988-writing-vector-icon.jpg'),
                                                radius: 23,
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Column(
                                                children: [
                                                  Text(
                                                    controller
                                                        .articles[position].name!,
                                                  ),
                                                  Text(
                                                    controller.articles[position]
                                                        .publishedAt!
                                                        .substring(0, 10),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          IconButton(
                                              icon: Icon(Icons.favorite),
                                              onPressed: null)
                                        ],
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                      ),
                                    ),
                                    (controller.articles[position].title) != null
                                        ? Text(
                                            controller.articles[position].title!,
                                            textDirection: TextDirection.rtl,
                                          )
                                        : Text(' '),
                                    SizedBox(
                                      height: 10,
                                    ),



                                    (controller.articles[position].description) != null
                                        ? ExpandableText(
                                            controller
                                                .articles[position].description!,
                                            expandText: 'Show more',
                                            collapseText: 'Show less',
                                            maxLines: 4,
                                            textDirection: TextDirection.rtl,
                                            linkColor: Colors.grey,
                                          )
                                        : SizedBox(
                                            height: 30,
                                          ),



                                    (controller.articles[position].urlToImage) !=
                                            null
                                        ? SizedBox(
                                            height: 250,
                                            width: double.infinity,
                                            child: Image.network(controller
                                                .articles[position].urlToImage!),
                                          )
                                        : SizedBox(
                                            height: 250,
                                            width: double.infinity,
                                            child: Image.network(
                                                'https://lh3.googleusercontent.com/proxy/02_rszD61HWFPbezs_isKK4TF-ApbAplBXCwxQ1s3hIsy9yC-blK4Y-Y5Ejwqy5_OenqKhTeXkjMZ4R7Mf7rAULJ8m18Tx67953E2d9L3Sjte0aR9jN7G_j9D5y3Ac2Cq1LdpB507oEVUpD1rsiESF7CHu8'),
                                          ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ),
      ),
    );
  }
}
