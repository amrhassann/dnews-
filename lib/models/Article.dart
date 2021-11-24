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
    this.urlToImage = map['urlToImage'];
    this.content = map['content'];
    this.name = map['source']['name'];
    this.publishedAt = map['publishedAt'];
  }
  // pass value from api to your variables
}
