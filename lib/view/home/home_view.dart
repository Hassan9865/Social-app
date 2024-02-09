// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

import 'package:social_app/List_data/circle_data.dart';
import 'package:social_app/view/home/home_view_model.dart';
import 'package:stacked/stacked.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  void signout() async {
    // await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        viewModelBuilder: () => HomeViewModel(),
        builder: (context, viewModel, child) {
          return Scaffold(
            backgroundColor: Colors.grey[50],
            appBar: AppBar(
              automaticallyImplyLeading: false,
              title: Text(
                "Home",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
              ),
              backgroundColor: Colors.blueGrey[300],
              elevation: 0,
              centerTitle: true,
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.logout),
                ),
              ],
            ),
            body: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: circlelist.length,
                      itemBuilder: ((context, index) {
                        double screenWidth = MediaQuery.of(context).size.width;
                        double avatarRdius = screenWidth * 0.10;
                        double containerSize = avatarRdius * 1.7;
                        return Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: CircleAvatar(
                                radius: avatarRdius,
                                backgroundColor: Colors.blue,
                                child: Container(
                                  height: 80,
                                  width: containerSize,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image:
                                          AssetImage(circlelist[index].image),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 100,
                              child: Center(
                                child: FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: Text(
                                    circlelist[index].title,
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        );
                      })),
                ),
                Expanded(
                    flex: 4,
                    child: ListView.builder(
                        itemCount: 5,
                        itemBuilder: (context, Index) {
                          double screenWidth =
                              MediaQuery.of(context).size.width;
                          double screenheight =
                              MediaQuery.of(context).size.height;
                          return Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Container(
                              height: screenheight * 0.4,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Color(0xffE6EEFA)),
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Column(
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        CircleAvatar(
                                          radius: screenWidth * 0.05,
                                          backgroundColor: Colors.amber,
                                          backgroundImage: AssetImage(
                                              circlelist[Index].image),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Title(
                                              color: Colors.black,
                                              child: Text(
                                                circlelist[Index].title,
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              )),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 0.8,
                                    ),
                                    Expanded(
                                      child: Container(
                                        // height: 150,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: Colors.pinkAccent,
                                          image: DecorationImage(
                                            image: AssetImage(
                                              "assets/images/post.jpg",
                                            ),
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Expanded(
                                              child: IconButton(
                                                onPressed: () {},
                                                icon: Icon(Icons.comment),
                                                color: Colors.white,
                                              ),
                                            ),
                                            Expanded(
                                              child: IconButton(
                                                onPressed: () {},
                                                icon: Icon(Icons.favorite),
                                                color: Colors.white,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 170,
                                            ),
                                            IconButton(
                                              onPressed: () {},
                                              icon: Icon(Icons.share_sharp),
                                              color: Colors.white,
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        }))
              ],
            ),
          );
        });
  }
}
