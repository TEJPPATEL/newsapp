import 'package:flutter/material.dart';
import 'package:newsappUI/api_service.dart';
import 'package:newsappUI/widgets/category_item.dart';
import 'package:share/share.dart';

class HomeScreen extends StatefulWidget {
  
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, dynamic>> category = [
    {"type": "Entertainment", "color": "0xFFFFFFFF", "textcolor": "0xFF263238"},
    {"type": "Sports", "color": "0xFFFFFFFF", "textcolor": "0xFF263238"},
    {"type": "Business", "color": "0xFFFFFFFF", "textcolor": "0xFF263238"},
    {"type": "Health", "color": "0xFFFFFFFF", "textcolor": "0xFF263238"},
    {"type": "Science", "color": "0xFFFFFFFF", "textcolor": "0xFF263238"},
    {"type": "Technology", "color": "0xFFFFFFFF", "textcolor": "0xFF263238"}
  ];
  int previousIndex = 1;

  String selectedValue = "Entertainment";

  @override
  Widget build(BuildContext context) {
    print("tik tik");
    //  List<Article> articles = getTopHeadLinesWithCategory();

    dispose() {
      category[previousIndex]["color"] = "0xFFFFFFFF";
    }

    return Scaffold(
        backgroundColor: Colors.blueGrey,
        body: Column(
          
          children: <Widget>[
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RichText(
                    text: TextSpan(children: [
                      TextSpan(
                        text: "N",
                        style: TextStyle(
                            color: Colors.black,
                            wordSpacing: 5,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text: "ews",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ]),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      "Buzz",
                      style: TextStyle(
                          color: Colors.black,
                          wordSpacing: 5,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),

       
            Expanded(
              flex: 2,
              child: Container(
                padding: EdgeInsets.all(10),
                child: Container(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: category.length,
                    itemBuilder: (context, index) => Container(
                      width: 200,
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            
                            selectedValue = category[index]["type"];
                            category[index]["color"] = "0xFF28363D";
                            category[index]["textcolor"] = "0xFFFFFFFF";
                            print(previousIndex);
                          });
                          //  previousIndex = index;
                          //   category[previousIndex]["color"] ="0xFFFFFFFF";
                          // category[index]["color"] = "0xFFFFFFFF";
                        },
                        child: Card(
                          color: Color(int.parse(category[index]["color"])),
                          child: Container(
                            padding: EdgeInsets.all(5),
                            alignment: Alignment.center,
                            child: Text(
                              category[index]["type"],
                              style: TextStyle(
                                  color: Color(
                                      int.parse(category[index]["textcolor"])),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

              
              ),
            ),
            Expanded(
              flex: 9,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25))),
                child: Column(children: [
                  Text(
                    selectedValue.toUpperCase(),
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
                  ),
                  Expanded(
                    // child: Text(selectedValue),
                    child: FutureBuilder(
                        future: getTopHeadLinesWithCategory(selectedValue),
                        builder: (context, snapshot) {
                          return snapshot.data != null
                              ? CategoryItem(snapshot.data)
                              : Center(child: CircularProgressIndicator());
                        }),
                  ),
                ]),
              ),
            )
          ],
        ));

  }
}
