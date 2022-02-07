import 'package:flutter/material.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(10),
      child: ListView.builder(
          itemCount: 15,
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) {
              return Container(
                margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 10.0),
                  height: 250,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: new AssetImage('assets/dogPicture2.jpg'),
                    )
                  ),
              );
            }
            if (index == 1) {
              return Container(
                margin: EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 10.0),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Brand Name', style: TextStyle(fontSize: 18, color: Colors.black54),),
                          Text('Product Name', style: TextStyle(fontSize: 30),),
                          Text("Volumn / Price", style: TextStyle(fontSize: 24),)
                        ],
                      ),
                      Expanded(
                        child: Container(
                          height: 80,
                          margin: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            border: Border.all(width: 2),
                            borderRadius: BorderRadius.circular(10)
                          ),
                          child: Center(
                            child: Text('Ingredient Data', style: TextStyle(fontSize: 20),),
                          )
                        ),
                      )
                    ],
                  )
              );
            }
            if (index == 2) {
              return Container(
                margin: EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Detail of Product', style: TextStyle(fontSize: 20),),
                    Container(
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              child: Text('contents area of detail contents area of detail contents area '
                                  'of detail contents area of detail contents area of detail contents area'
                                  ' of detailcontents area of detail contents area of detail contents '
                                  ' of detailcontents area of detail contents area of detail contents area'
                                  ' of detailcontents area of detail contents area of detail contents area '
                                  'of detailcontents area of detail contents area of detail contents area of detail', style: TextStyle(fontSize: 18),),
                            ),
                          ),
                        ]
                      )
                    )
                  ]
                )
              );
            }

            return ReviewBox(index: index-2);
          }
      ),
    );
  }
}

class ReviewBox extends StatelessWidget {
  const ReviewBox({Key? key, required this.index}) : super(key: key);

  final int index;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.all(5.0),
            width: 80,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text('User $index', style: TextStyle(fontSize: 20, color: Colors.redAccent),),
                Text('Post Date', style: TextStyle(fontSize: 20, color: Colors.black),),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(5.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    for( var i = 0 ; i < 5; i++ )
                      new IconTheme(
                        data: new IconThemeData(color: Colors.redAccent),
                        child: new Icon(Icons.star_rounded, size: 25,), // I want to iterate this "star icon" for reviews.ratings.length times
                      ),
                  ],
                ),
                Text('Title area of comment', style: TextStyle(fontSize: 20),),
                Container(
                  width: 290,
                  child: Row(
                    children: [
                      Flexible(
                        child: Text('contents area of comment contents area of comment contents '
                        'area of comment contents area of comment contents area of comment contents area '
                        'of comment contents area of comment', style: TextStyle(fontSize: 18, color: Colors.black54)),
                      )

                    ]
                  )
                )
              ],
            ),
          )
        ],
      )
    );
  }
}
