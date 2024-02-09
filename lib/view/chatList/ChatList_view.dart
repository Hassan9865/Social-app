import 'package:flutter/material.dart';
import 'package:social_app/List_data/home_list.dart';
import 'package:social_app/view/chatList/chatList_viewModel.dart';
import 'package:stacked/stacked.dart';

class ChatListView extends StatelessWidget {
  const ChatListView({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    return ViewModelBuilder.reactive(
        viewModelBuilder: () => ChatListViewModel(),
        builder: (context, ViewModel, child) {
          return Scaffold(
            backgroundColor: Colors.grey[200],
            appBar: AppBar(
              automaticallyImplyLeading: false,
              title: Text(
                "Chat",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
              ),
              centerTitle: true,
              backgroundColor: Colors.blueGrey[300],
              elevation: 0,
            ),
            //   actions: [
            //     SwitchWidget(),
            //   ],
            // ),
            // drawer: MyDrawer(),
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: searchController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(50.0)),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      fillColor: Color(0xffEDF8FF),
                      filled: true,
                      hintText: "search",
                      hintStyle: TextStyle(color: Colors.grey),
                      prefixIcon: Icon(Icons.search, color: Colors.grey),
                    ),
                  ),
                ),
                Expanded(
                    child: ListView.builder(
                        itemCount: profilelist.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                              onTap: () {
                                ViewModel.navigateToChatView();
                              },
                              child: ListTile(
                                shape: RoundedRectangleBorder(
                                  //<-- SEE HERE
                                  side: BorderSide(width: 2),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                leading: CircleAvatar(
                                  radius: 30,
                                  backgroundImage:
                                      AssetImage(profilelist[index].image),
                                  backgroundColor: const Color(0xff6ae792),
                                ),
                                title: Text(
                                  profilelist[index].title,
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                ),
                                subtitle: Text(profilelist[index].subtitle),
                                trailing: Icon(Icons.more_vert),
                                tileColor: Color(0xffEDF8FF),
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
