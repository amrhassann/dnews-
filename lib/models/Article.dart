class Article {
  String? author, title, description, url, urlToImage, content , name , publishedAt; //simple vars
  Article(
      this.author,
      this.title,
      this.description,
      this.url,
      this.urlToImage,
      this.content,
      this.name,
      this.publishedAt
      );//simple constructor

  Article.fromjson(Map<String, dynamic> map) {
    this.author = map['author'];
    this.title = map['title'];
    this.description = map['description'];
    this.url = map['url'];
    this.urlToImage = map['urlToImage']==null?'https://barkia.net/wp-content/uploads/2020/06/%D8%AE%D8%A8%D8%B1-%D8%B9%D8%A7%D8%AC%D9%84-%D8%A5%D8%B9%D8%A7%D8%AF%D8%A9-%D8%A7%D9%84%D9%85%D8%A8%D8%A7%D9%84%D8%BA-%D8%A7%D9%84%D9%85%D8%B3%D8%AA%D9%82%D8%B7%D8%B9%D8%A9-%D9%85%D9%86-%D8%B1%D9%88%D8%A7%D8%AA%D8%A8-%D8%A7%D9%84%D9%85%D8%AA%D9%82%D8%A7%D8%B9%D8%AF%D9%8A%D9%86-640x470.jpg':map['urlToImage'];
    this.content = map['content'];
    this.name = map['source']['name'];
    this.publishedAt = map['publishedAt'];
  }
  // pass value from api to your variables
}
