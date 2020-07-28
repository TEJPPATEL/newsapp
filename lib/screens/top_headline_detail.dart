import 'dart:io';

import 'package:flutter/material.dart';

import 'package:newsappUI/models/article.dart';
import 'package:url_launcher/url_launcher.dart';

class TopHeadLineDetail extends StatelessWidget {
  // static const ROUTE_NAME = "/top-head-line-details";

  final Article article;
  TopHeadLineDetail(this.article);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              child: Stack(
                children: <Widget>[
                  // Container(
                  //   width: double.infinity,
                  //    height: MediaQuery.of(context).size.height * 0.5,
                  //   child: FittedBox(
                  Image.network(
                    article.urlToImage != null
                        ? article.urlToImage
                        : "https://bitsofco.de/content/images/2018/12/broken-1.png",
                    fit: BoxFit.fill,
                    height: MediaQuery.of(context).size.width,
                    width: MediaQuery.of(context).size.width,
                    // alignment:
                    //   ),
                    // ),
                  ),
                  Container(
                      alignment: Alignment.bottomRight,
                      child: Icon(Icons.share))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                article.title,
                style: TextStyle(fontWeight: FontWeight.bold, wordSpacing: 5),
                textAlign: TextAlign.justify,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                article.description != null ? article.description : '',
                style: TextStyle(),
                textAlign: TextAlign.justify,
              ),
            ),
            Container(
              // width: 300,
              // height: 300,
              padding: const EdgeInsets.all(8.0),
              child: Text(
                article.content != null
                    ? article.content
                            .substring(0, article.content.length - 13) +
                        '[More]'
                    : '',
                textAlign: TextAlign.justify,

                // style: TextStyle(fontSize: 20),

                // maxLines: 10,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 1.0),
              // child: Linkify(
              //   onOpen: (link) async {
              //     // const url = '${link.url}';
              //     if (await canLaunch('${link.url}')) {
              //       await launch('${link.url}', forceWebView: true);
              //     } else {
              //       throw 'Could not launch';
              //     }
              //     print("Clicked ${link.url}!");
              //   },
              //   text: "More:-"+article.url,
              //   options: LinkifyOptions(humanize: true),
              // ),
              child: FlatButton(
                child: Text("Read More"),
                onPressed: () async {
                  //  const url = "${article.url";
                  if (await canLaunch(article.url)) {
                    await launch(article.url, forceWebView: true);
                  } else {
                    throw "Could Not Found";
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
