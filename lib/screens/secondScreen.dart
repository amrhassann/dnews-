import 'package:dnews/Api/newsApi.dart';
import 'package:dnews/main.dart';
import 'package:dnews/models/Article.dart';
import 'package:flutter/material.dart';
import 'package:dnews/constants.dart';
import 'package:expandable_text/expandable_text.dart';

class SecondScreen extends StatefulWidget {
  final String topSelected;
  SecondScreen({this.topSelected});
  @override
  _SecondScreenState createState() => _SecondScreenState(topSelected);
}

class _SecondScreenState extends State<SecondScreen> {
  NewsApi newsApi = new NewsApi();
  List<Article> articles = [];
  int page = 5;
  int currentPage = 1;
  bool loading = true;
  ScrollController scrollController = new ScrollController();
  final String selectedCategory;
  _SecondScreenState(this.selectedCategory);
  fetchNews() {
    newsApi
        .fetchArticle(
            page: currentPage, category: selectedCategory, country: 'eg')
        .then((futureArticles) {
      articles.addAll(futureArticles);
      setState(() {
        loading = false;
        if (currentPage != page) {
          currentPage++;
        }
      });
    });
  }

  @override
  void initState() {
    super.initState();
    fetchNews();
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        fetchNews();
      }
    });
  } //the end of initState

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(selectedCategory + ' news' , style: TextStyle(color: Colors.blue[700]),),
          centerTitle: true,
          leading: IconButton(
            icon:Icon(Icons.arrow_back_rounded , color: Colors.blue[700],),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>App()));
            },
          ),
          backgroundColor: Colors.white,
        ),
        body: Container(
          child: loading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  controller: scrollController,
                  itemCount: articles.length + 1,
                  itemBuilder: (BuildContext context, int position) {
                    if (position == articles.length) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    }
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical:0),
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
                                    Row(children: [
                                      CircleAvatar(
                                        backgroundImage: NetworkImage(
                                            'https://previews.123rf.com/images/jabkitticha/jabkitticha1702/jabkitticha170200059/72834988-writing-vector-icon.jpg'
                                        ),
                                        radius: 23,
                                      ),
                                      SizedBox(width: 5,),
                                      Column(
                                        children: [
                                          Text(
                                            articles[position].name,
                                            style: kAuthorTextStyle,
                                          ),
                                          Text(articles[position].publishedAt.substring(0,10) ,style: kDateTextStyle,),
                                        ],
                                      ),
                                    ],),
                                      IconButton(
                                          icon: Icon(Icons.favorite)
                                          , onPressed: null

                                      )
                                    ],
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  ),
                                ),
                                (articles[position].title) != null
                                    ? Text(
                                        articles[position].title,
                                        style: kTitleTextStyle,
                                        textDirection: TextDirection.rtl,
                                      )
                                    : Text(' '),
                                SizedBox(height: 10,),
                                (articles[position].description) != null
                                    ? ExpandableText(
                                        articles[position].description,
                                        expandText: 'Show more',
                                        collapseText: 'Show less',
                                        maxLines: 2,
                                        style: kDescriptionTextStyle,
                                        textDirection: TextDirection.rtl,
                                  linkColor: Colors.grey,
                                      )
                                    : SizedBox(
                                        height: 30,
                                      ),

                                (articles[position].urlToImage) != null
                                    ? SizedBox(
                                  height: 250,
                                  width:double.infinity ,
                                  child: Image.network(
                                      articles[position].urlToImage),
                                )
                                    : SizedBox(
                                  height: 250,
                                  width:double.infinity ,
                                  child: Image.network(
                                      'https://lh3.googleusercontent.com/proxy/02_rszD61HWFPbezs_isKK4TF-ApbAplBXCwxQ1s3hIsy9yC-blK4Y-Y5Ejwqy5_OenqKhTeXkjMZ4R7Mf7rAULJ8m18Tx67953E2d9L3Sjte0aR9jN7G_j9D5y3Ac2Cq1LdpB507oEVUpD1rsiESF7CHu8'),
                                ),


                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
        ),
      ),
    );
  }
}
