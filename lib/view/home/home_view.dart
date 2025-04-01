// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:ui';

import 'package:social_app/List_data/circle_data.dart';
import 'package:social_app/view/home/home_viewModel.dart';
import 'package:stacked/stacked.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

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
                              height: screenheight * 0.5,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Color(0xffE6EEFA),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        CircleAvatar(
                                          radius: screenWidth * 0.05,
                                          backgroundColor: Colors.amber,
                                          backgroundImage: AssetImage(
                                              circlelist[Index].image),
                                        ),
                                        SizedBox(width: 8),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                circlelist[Index].title,
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 1,
                                              ),
                                              Text(
                                                "1 hour ago",
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Text(
                                          "Following",
                                          style: TextStyle(
                                            color: Colors.blue,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 8),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "The picture is amazing",
                                        style: TextStyle(fontSize: 16),
                                      ),
                                    ),
                                    SizedBox(height: 8),
                                    Expanded(
                                      child: FractionallySizedBox(
                                        heightFactor: 1,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            color: Colors.pinkAccent,
                                            image: DecorationImage(
                                              image: AssetImage(
                                                  "assets/images/post.jpg"),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 8),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            IconButton(
                                              onPressed: () {},
                                              icon:
                                                  Icon(Icons.comment_outlined),
                                              color: Colors.grey,
                                            ),
                                            Text("230",
                                                style: TextStyle(
                                                    color: Colors.grey)),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            IconButton(
                                              onPressed: () {},
                                              icon:
                                                  Icon(Icons.favorite_outline),
                                              color: Colors.grey,
                                            ),
                                            Text("230",
                                                style: TextStyle(
                                                    color: Colors.grey)),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            IconButton(
                                              onPressed: () {},
                                              icon: Icon(Icons.share_outlined),
                                              color: Colors.grey,
                                            ),
                                            Text("130",
                                                style: TextStyle(
                                                    color: Colors.grey)),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                          // return Padding(
                          //   padding: const EdgeInsets.all(20.0),
                          //   child: Container(
                          //     height: screenheight * 0.4,
                          //     decoration: BoxDecoration(
                          //         borderRadius: BorderRadius.circular(20),
                          //         color: Color(0xffE6EEFA)),
                          //     child: Padding(
                          //       padding: const EdgeInsets.all(12.0),
                          //       child: Column(
                          //         mainAxisAlignment: MainAxisAlignment.start,
                          //         children: [
                          //           Column(
                          //             children: [
                          //               Row(
                          //                 children: [
                          //                   Expanded(
                          //                     child: Row(
                          //                       children: [
                          //                         CircleAvatar(
                          //                           radius: screenWidth * 0.05,
                          //                           backgroundColor:
                          //                               Colors.amber,
                          //                           backgroundImage: AssetImage(
                          //                               circlelist[Index]
                          //                                   .image),
                          //                         ),
                          //                         SizedBox(width: 8),
                          //                         Expanded(
                          //                           child: Column(
                          //                             crossAxisAlignment:
                          //                                 CrossAxisAlignment
                          //                                     .start,
                          //                             children: [
                          //                               Text(
                          //                                 circlelist[Index]
                          //                                     .title,
                          //                                 style: TextStyle(
                          //                                   fontSize: 18,
                          //                                   fontWeight:
                          //                                       FontWeight.w500,
                          //                                 ),
                          //                                 overflow: TextOverflow
                          //                                     .ellipsis,
                          //                                 maxLines: 1,
                          //                               ),
                          //                               Text(
                          //                                 "1 hour ago",
                          //                                 style: TextStyle(
                          //                                   fontSize: 14,
                          //                                   color: Colors.grey,
                          //                                 ),
                          //                               ),
                          //                             ],
                          //                           ),
                          //                         ),
                          //                       ],
                          //                     ),
                          //                   ),
                          //                   Padding(
                          //                     padding: const EdgeInsets.only(
                          //                         left: 8.0),
                          //                     child: Text(
                          //                       "Following",
                          //                       style: TextStyle(
                          //                         color: Colors.blue,
                          //                       ),
                          //                     ),
                          //                   ),
                          //                 ],
                          //               ),
                          //               Text("The picture is amizng"),
                          //               Row(
                          //                 crossAxisAlignment:
                          //                     CrossAxisAlignment.end,
                          //                 children: [
                          //                   Expanded(
                          //                     child: Row(
                          //                       children: [
                          //                         IconButton(
                          //                           onPressed: () {},
                          //                           icon: Icon(
                          //                               Icons.comment_outlined),
                          //                           color: Colors.grey,
                          //                         ),
                          //                         Expanded(
                          //                             child: Text(
                          //                           "230",
                          //                           style: TextStyle(
                          //                               color: Colors.grey),
                          //                         )),
                          //                       ],
                          //                     ),
                          //                   ),
                          //                   Expanded(
                          //                     child: Row(
                          //                       children: [
                          //                         IconButton(
                          //                           onPressed: () {},
                          //                           icon: Icon(
                          //                               Icons.favorite_outline),
                          //                           color: Colors.grey,
                          //                         ),
                          //                         Expanded(
                          //                             child: Text(
                          //                           "230",
                          //                           style: TextStyle(
                          //                               color: Colors.grey),
                          //                         )),
                          //                       ],
                          //                     ),
                          //                   ),
                          //                   SizedBox(
                          //                     width: 170,
                          //                   ),
                          //                   Expanded(
                          //                     child: Row(
                          //                       children: [
                          //                         IconButton(
                          //                           onPressed: () {},
                          //                           icon: Icon(
                          //                               Icons.share_outlined),
                          //                           color: Colors.grey,
                          //                         ),
                          //                         Expanded(
                          //                             child: Text(
                          //                           "130",
                          //                           style: TextStyle(
                          //                               color: Colors.grey),
                          //                         )),
                          //                       ],
                          //                     ),
                          //                   )
                          //                 ],
                          //               ),
                          //             ],
                          //           ),
                          //           SizedBox(
                          //             height: 0.8,
                          //           ),
                          //           Expanded(
                          //             child: Container(
                          //               // height: 150,
                          //               decoration: BoxDecoration(
                          //                 borderRadius:
                          //                     BorderRadius.circular(20),
                          //                 color: Colors.pinkAccent,
                          //                 image: DecorationImage(
                          //                   image: AssetImage(
                          //                     "assets/images/post.jpg",
                          //                   ),
                          //                   fit: BoxFit.fill,
                          //                 ),
                          //               ),
                          //             ),
                          //           ),
                          //         ],
                          //       ),
                          //     ),
                          //   ),
                          // );
                        }))
              ],
            ),
          );
        });
  }
}
