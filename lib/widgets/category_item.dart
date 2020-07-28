import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:newsappUI/models/article.dart';
import 'package:newsappUI/screens/top_headline_detail.dart';
import 'package:share/share.dart';

class CategoryItem extends StatelessWidget {
  final List<Article> articles;
  CategoryItem(this.articles);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.only(top: 10),
      itemCount: articles.length,
      itemBuilder: (_, index) => Container(
        height: 150,
        child: InkWell(
          onTap: () {
            print(articles[index]);
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => TopHeadLineDetail(articles[index])));
          },
          child: Card(
            elevation: 5,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Row(
              children: <Widget>[
                ClipRRect(
                  // borderRadius: BorderRadius.only(
                  //   topLeft: Radius.circular(10),
                  //   bottomLeft: Radius.circular(10),
                  // ),
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    articles[index].urlToImage == null
                        ? "https://bitsofco.de/content/images/2018/12/broken-1.png"
                        : articles[index].urlToImage,
                    fit: BoxFit.cover,
                    height: 150,
                    width: 170,
                  ),
                ),
                Flexible(
                  child: Container(
                    padding: EdgeInsets.only(left: 6),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Flexible(
                          child: Text(
                            articles[index].title,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            // Text(DateFormat.yMd(articles[index].publishedAt).toString()),
                            Text(DateFormat.jms()
                                .format(
                                    DateTime.parse(articles[index].publishedAt))
                                .toString()),
                            IconButton(
                              onPressed: () {
                                final RenderBox box =
                                    context.findRenderObject();
                                Share.share(articles[index].url,
                                    sharePositionOrigin:
                                        box.localToGlobal(Offset.zero) &
                                            box.size);
                              },
                              icon: Icon(Icons.share),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              
              ],
            ),
          ),
        ),
      ),
    );
  }
}
