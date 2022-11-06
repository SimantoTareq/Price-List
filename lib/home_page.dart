import 'package:day_25/model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:bouncing_widget/bouncing_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final list1 = Model_class.generatedList();
  TextEditingController nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.fromLTRB(6, 16, 6, 4),
          color: Color.fromARGB(255, 243, 242, 238),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Hey Marvin',
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    Container(
                        color: Color.fromARGB(255, 238, 229, 203),
                        padding: EdgeInsets.all(4),
                        child: Icon(Icons.notifications)),
                  ],
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Let's Make A Bid!",
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                        fontWeight: FontWeight.w300),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: Row(
                    children: [
                      Expanded(
                        flex: 10,
                        child: Container(
                          color: Colors.white,
                          width: 50,
                          child: TextField(
                            controller: nameController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(Icons.search),
                              hintText: 'Search Name',
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Expanded(
                          flex: 2,
                          child: Container(
                            height: 50,
                            color: Colors.black,
                            child: Icon(
                              Icons.multiple_stop_rounded,
                              color: Colors.grey,
                            ),
                          )),
                    ],
                  ),
                ),
                SizedBox(
                  height: 24,
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Categories',
                      style: TextStyle(
                          fontSize: 24,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    Text('See All'),
                  ],
                ),
                SizedBox(
                  height: 14,
                ),
                Container(
                    height: 140,
                    color: Colors.white,
                    child: ListView.builder(
                        //padding: EdgeInsets.all(10),
                        itemCount: list1.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Container(
                              padding: EdgeInsets.symmetric(vertical: 20),
                              margin: EdgeInsets.fromLTRB(4, 0, 4, 0),
                              color: Color.fromARGB(255, 238, 229, 203),
                              width: 100,
                              height: 60,
                              child: Column(
                                children: [
                                  Image.asset(
                                    list1[index].img,
                                    height: 50,
                                    width: 50,
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text("${list1[index].name}"),
                                ],
                              ));
                        })),
                SizedBox(
                  height: 24,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Trending Auctions',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                    Text('See All',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                          fontSize: 14,
                        )),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: list1.length,
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 1,
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10),
                  itemBuilder: (context, index) => Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            Container(
                              color: Color.fromARGB(255, 238, 229, 203)
                                  .withOpacity(0.8),
                              child: Image.asset(
                                list1[index].img,
                                height: 100,
                                width: double.infinity,
                              ),
                            ),
                            Positioned(
                              top: 2,
                              left: 140,
                              child: IconButton(
                                onPressed: () {
                                  setState(() {
                                    list1[index].isLike = !list1[index].isLike;
                                  });
                                },
                                icon: Icon(
                                  Icons.favorite,
                                  color: list1[index].isLike == true
                                      ? Colors.red
                                      : Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          list1[index].name,
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Text(
                                  'Current Price',
                                  style: TextStyle(color: Colors.grey),
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Align(
                                    alignment: Alignment.bottomLeft,
                                    child: Text(list1[index].price)),
                              ],
                            ),
                            Container(
                                padding: EdgeInsets.all(8),
                                color: Color(0xff1F1C14),
                                child: Text(
                                  'Buy Now',
                                  style: TextStyle(color: Colors.yellow),
                                )),
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
