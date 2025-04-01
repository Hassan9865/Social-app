// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'dart:ui';
// import 'package:social_app/List_data/circle_data.dart';
// import 'package:social_app/view/home/home_viewModel.dart';
// import 'package:stacked/stacked.dart';

// class HomeView extends StatelessWidget {
//   const HomeView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ViewModelBuilder.reactive(
//         viewModelBuilder: () => HomeViewModel(),
//         builder: (context, viewModel, child) {
//           return Scaffold(
//             backgroundColor: Colors.grey[50],
//             appBar: AppBar(
//               automaticallyImplyLeading: false,
//               title: Text(
//                 "Home",
//                 style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
//               ),
//               backgroundColor: Colors.blueGrey[300],
//               elevation: 0,
//               centerTitle: true,
//               actions: [
//                 IconButton(
//                   onPressed: () {},
//                   icon: Icon(Icons.logout),
//                 ),
//               ],
//             ),
//             body: Column(
//               children: [
//                 Expanded(
//                   child: ListView.builder(
//                       scrollDirection: Axis.horizontal,
//                       itemCount: circlelist.length,
//                       itemBuilder: ((context, index) {
//                         double screenWidth = MediaQuery.of(context).size.width;
//                         double avatarRdius = screenWidth * 0.10;
//                         double containerSize = avatarRdius * 1.7;
//                         return Column(
//                           children: [
//                             Padding(
//                               padding: EdgeInsets.all(8.0),
//                               child: CircleAvatar(
//                                 radius: avatarRdius,
//                                 backgroundColor: Colors.blue,
//                                 child: Container(
//                                   height: 80,
//                                   width: containerSize,
//                                   decoration: BoxDecoration(
//                                     shape: BoxShape.circle,
//                                     image: DecorationImage(
//                                       fit: BoxFit.cover,
//                                       image:
//                                           AssetImage(circlelist[index].image),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             SizedBox(
//                               width: 100,
//                               child: Center(
//                                 child: FittedBox(
//                                   fit: BoxFit.scaleDown,
//                                   child: Text(
//                                     circlelist[index].title,
//                                     style: TextStyle(
//                                       fontSize: 18,
//                                       fontWeight: FontWeight.w400,
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             )
//                           ],
//                         );
//                       })),
//                 ),
//                 Expanded(
//                     flex: 4,
//                     child: ListView.builder(
//                         itemCount: 5,
//                         itemBuilder: (context, Index) {
//                           double screenWidth =
//                               MediaQuery.of(context).size.width;
//                           double screenheight =
//                               MediaQuery.of(context).size.height;
//                           return Padding(
//                             padding: const EdgeInsets.all(20.0),
//                             child: Container(
//                               height: screenheight * 0.5,
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(20),
//                                 color: Color(0xffE6EEFA),
//                               ),
//                               child: Padding(
//                                 padding: const EdgeInsets.all(12.0),
//                                 child: Column(
//                                   children: [
//                                     Row(
//                                       children: [
//                                         CircleAvatar(
//                                           radius: screenWidth * 0.05,
//                                           backgroundColor: Colors.amber,
//                                           backgroundImage: AssetImage(
//                                               circlelist[Index].image),
//                                         ),
//                                         SizedBox(width: 8),
//                                         Expanded(
//                                           child: Column(
//                                             crossAxisAlignment:
//                                                 CrossAxisAlignment.start,
//                                             children: [
//                                               Text(
//                                                 circlelist[Index].title,
//                                                 style: TextStyle(
//                                                   fontSize: 18,
//                                                   fontWeight: FontWeight.w500,
//                                                 ),
//                                                 overflow: TextOverflow.ellipsis,
//                                                 maxLines: 1,
//                                               ),
//                                               Text(
//                                                 "1 hour ago",
//                                                 style: TextStyle(
//                                                   fontSize: 14,
//                                                   color: Colors.grey,
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                         Text(
//                                           "Following",
//                                           style: TextStyle(
//                                             color: Colors.blue,
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                     SizedBox(height: 8),
//                                     Align(
//                                       alignment: Alignment.centerLeft,
//                                       child: Text(
//                                         "The picture is amazing",
//                                         style: TextStyle(fontSize: 16),
//                                       ),
//                                     ),
//                                     SizedBox(height: 8),
//                                     Expanded(
//                                       child: FractionallySizedBox(
//                                         heightFactor: 1,
//                                         child: Container(
//                                           decoration: BoxDecoration(
//                                             borderRadius:
//                                                 BorderRadius.circular(15),
//                                             color: Colors.pinkAccent,
//                                             image: DecorationImage(
//                                               image: AssetImage(
//                                                   "assets/images/post.jpg"),
//                                               fit: BoxFit.cover,
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                     SizedBox(height: 8),
//                                     Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.spaceBetween,
//                                       children: [
//                                         Row(
//                                           children: [
//                                             IconButton(
//                                               onPressed: () {},
//                                               icon:
//                                                   Icon(Icons.comment_outlined),
//                                               color: Colors.grey,
//                                             ),
//                                             Text("230",
//                                                 style: TextStyle(
//                                                     color: Colors.grey)),
//                                           ],
//                                         ),
//                                         Row(
//                                           children: [
//                                             IconButton(
//                                               onPressed: () {},
//                                               icon:
//                                                   Icon(Icons.favorite_outline),
//                                               color: Colors.grey,
//                                             ),
//                                             Text("230",
//                                                 style: TextStyle(
//                                                     color: Colors.grey)),
//                                           ],
//                                         ),
//                                         Row(
//                                           children: [
//                                             IconButton(
//                                               onPressed: () {},
//                                               icon: Icon(Icons.share_outlined),
//                                               color: Colors.grey,
//                                             ),
//                                             Text("130",
//                                                 style: TextStyle(
//                                                     color: Colors.grey)),
//                                           ],
//                                         ),
//                                       ],
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           );
//                           // return Padding(
//                           //   padding: const EdgeInsets.all(20.0),
//                           //   child: Container(
//                           //     height: screenheight * 0.4,
//                           //     decoration: BoxDecoration(
//                           //         borderRadius: BorderRadius.circular(20),
//                           //         color: Color(0xffE6EEFA)),
//                           //     child: Padding(
//                           //       padding: const EdgeInsets.all(12.0),
//                           //       child: Column(
//                           //         mainAxisAlignment: MainAxisAlignment.start,
//                           //         children: [
//                           //           Column(
//                           //             children: [
//                           //               Row(
//                           //                 children: [
//                           //                   Expanded(
//                           //                     child: Row(
//                           //                       children: [
//                           //                         CircleAvatar(
//                           //                           radius: screenWidth * 0.05,
//                           //                           backgroundColor:
//                           //                               Colors.amber,
//                           //                           backgroundImage: AssetImage(
//                           //                               circlelist[Index]
//                           //                                   .image),
//                           //                         ),
//                           //                         SizedBox(width: 8),
//                           //                         Expanded(
//                           //                           child: Column(
//                           //                             crossAxisAlignment:
//                           //                                 CrossAxisAlignment
//                           //                                     .start,
//                           //                             children: [
//                           //                               Text(
//                           //                                 circlelist[Index]
//                           //                                     .title,
//                           //                                 style: TextStyle(
//                           //                                   fontSize: 18,
//                           //                                   fontWeight:
//                           //                                       FontWeight.w500,
//                           //                                 ),
//                           //                                 overflow: TextOverflow
//                           //                                     .ellipsis,
//                           //                                 maxLines: 1,
//                           //                               ),
//                           //                               Text(
//                           //                                 "1 hour ago",
//                           //                                 style: TextStyle(
//                           //                                   fontSize: 14,
//                           //                                   color: Colors.grey,
//                           //                                 ),
//                           //                               ),
//                           //                             ],
//                           //                           ),
//                           //                         ),
//                           //                       ],
//                           //                     ),
//                           //                   ),
//                           //                   Padding(
//                           //                     padding: const EdgeInsets.only(
//                           //                         left: 8.0),
//                           //                     child: Text(
//                           //                       "Following",
//                           //                       style: TextStyle(
//                           //                         color: Colors.blue,
//                           //                       ),
//                           //                     ),
//                           //                   ),
//                           //                 ],
//                           //               ),
//                           //               Text("The picture is amizng"),
//                           //               Row(
//                           //                 crossAxisAlignment:
//                           //                     CrossAxisAlignment.end,
//                           //                 children: [
//                           //                   Expanded(
//                           //                     child: Row(
//                           //                       children: [
//                           //                         IconButton(
//                           //                           onPressed: () {},
//                           //                           icon: Icon(
//                           //                               Icons.comment_outlined),
//                           //                           color: Colors.grey,
//                           //                         ),
//                           //                         Expanded(
//                           //                             child: Text(
//                           //                           "230",
//                           //                           style: TextStyle(
//                           //                               color: Colors.grey),
//                           //                         )),
//                           //                       ],
//                           //                     ),
//                           //                   ),
//                           //                   Expanded(
//                           //                     child: Row(
//                           //                       children: [
//                           //                         IconButton(
//                           //                           onPressed: () {},
//                           //                           icon: Icon(
//                           //                               Icons.favorite_outline),
//                           //                           color: Colors.grey,
//                           //                         ),
//                           //                         Expanded(
//                           //                             child: Text(
//                           //                           "230",
//                           //                           style: TextStyle(
//                           //                               color: Colors.grey),
//                           //                         )),
//                           //                       ],
//                           //                     ),
//                           //                   ),
//                           //                   SizedBox(
//                           //                     width: 170,
//                           //                   ),
//                           //                   Expanded(
//                           //                     child: Row(
//                           //                       children: [
//                           //                         IconButton(
//                           //                           onPressed: () {},
//                           //                           icon: Icon(
//                           //                               Icons.share_outlined),
//                           //                           color: Colors.grey,
//                           //                         ),
//                           //                         Expanded(
//                           //                             child: Text(
//                           //                           "130",
//                           //                           style: TextStyle(
//                           //                               color: Colors.grey),
//                           //                         )),
//                           //                       ],
//                           //                     ),
//                           //                   )
//                           //                 ],
//                           //               ),
//                           //             ],
//                           //           ),
//                           //           SizedBox(
//                           //             height: 0.8,
//                           //           ),
//                           //           Expanded(
//                           //             child: Container(
//                           //               // height: 150,
//                           //               decoration: BoxDecoration(
//                           //                 borderRadius:
//                           //                     BorderRadius.circular(20),
//                           //                 color: Colors.pinkAccent,
//                           //                 image: DecorationImage(
//                           //                   image: AssetImage(
//                           //                     "assets/images/post.jpg",
//                           //                   ),
//                           //                   fit: BoxFit.fill,
//                           //                 ),
//                           //               ),
//                           //             ),
//                           //           ),
//                           //         ],
//                           //       ),
//                           //     ),
//                           //   ),
//                           // );
//                         }))
//               ],
//             ),
//           );
//         });
//   }
// }

import 'package:flutter/material.dart';
import 'package:social_app/List_data/circle_data.dart';
import 'package:social_app/view/home/home_viewModel.dart';
import 'package:stacked/stacked.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    // final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return ViewModelBuilder.reactive(
      viewModelBuilder: () => HomeViewModel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          backgroundColor: Colors.grey[50],
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Text(
              "Social App",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
                color: Colors.white,
              ),
            ),
            backgroundColor: Colors.blueGrey[700],
            elevation: 0,
            centerTitle: true,
            // actions: [
            //   IconButton(
            //     onPressed: () {},
            //     icon: Icon(Icons.search, color: Colors.white),
            //     tooltip: 'Search',
            //   ),
            //   IconButton(
            //     onPressed: () {},
            //     icon: Icon(Icons.notifications_outlined, color: Colors.white),
            //     tooltip: 'Notifications',
            //   ),
            // ],
          ),
          body: RefreshIndicator(
            onRefresh: () async {
              await Future.delayed(Duration(seconds: 1));
            },
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              child: Column(
                children: [
                  _buildStoriesSection(context),
                  _buildPostsList(context, screenHeight),
                ],
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            backgroundColor: Colors.blueGrey[700],
            child: Icon(Icons.add, color: Colors.white),
            elevation: 2,
          ),
        );
      },
    );
  }

  Widget _buildStoriesSection(BuildContext context) {
    return Container(
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(vertical: 10),
        itemCount: circlelist.length + 1,
        itemBuilder: (context, index) {
          if (index == 0) {
            return _buildAddStoryButton();
          }
          final storyIndex = index - 1;
          return _buildStoryCircle(context, storyIndex);
        },
      ),
    );
  }

  Widget _buildAddStoryButton() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey[200],
              border: Border.all(color: Colors.grey[300]!, width: 2),
            ),
            child: Icon(Icons.add, size: 30, color: Colors.blueGrey[700]),
          ),
          SizedBox(height: 5),
          Text("Your Story", style: TextStyle(fontSize: 12)),
        ],
      ),
    );
  }

  Widget _buildStoryCircle(BuildContext context, int index) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.blue, width: 2),
            ),
            child: Padding(
              padding: EdgeInsets.all(2),
              child: CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage(circlelist[index].image),
              ),
            ),
          ),
          SizedBox(height: 5),
          SizedBox(
            width: 70,
            child: Text(
              circlelist[index].title,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPostsList(BuildContext context, double screenHeight) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: 5,
      itemBuilder: (context, index) {
        return _buildPostCard(context, index, screenHeight);
      },
    );
  }

  Widget _buildPostCard(BuildContext context, int index, double screenHeight) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage(circlelist[index].image),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        circlelist[index].title,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        "1 hour ago • Public",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.more_vert, color: Colors.grey),
                ),
              ],
            ),
            SizedBox(height: 12),
            Text(
              "The picture is amazing. This is a sample post content that can be longer than one line.",
              style: TextStyle(fontSize: 14),
            ),
            SizedBox(height: 12),
            Container(
              height: screenHeight * 0.35,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage("assets/images/post.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 12),
            Row(
              children: [
                Icon(Icons.favorite, color: Colors.red, size: 18),
                SizedBox(width: 4),
                Text("230", style: TextStyle(color: Colors.grey)),
                SizedBox(width: 15),
                Icon(Icons.comment, color: Colors.grey, size: 18),
                SizedBox(width: 4),
                Text("56", style: TextStyle(color: Colors.grey)),
                Spacer(),
                Text("1.2k shares", style: TextStyle(color: Colors.grey)),
              ],
            ),
            Divider(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildPostActionButton(Icons.thumb_up_outlined, "Like"),
                _buildPostActionButton(Icons.comment_outlined, "Comment"),
                _buildPostActionButton(Icons.share_outlined, "Share"),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPostActionButton(IconData icon, String label) {
    return TextButton.icon(
      onPressed: () {},
      icon: Icon(icon, color: Colors.blueGrey),
      label: Text(label, style: TextStyle(color: Colors.blueGrey)),
      style: TextButton.styleFrom(
        minimumSize: Size(0, 40),
      ),
    );
  }
}
