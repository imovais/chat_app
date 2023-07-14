
import 'package:chat_app/Views/HomePage/homepage_viewmodel.dart';
import 'package:chat_app/Widgets/contactview.dart';
import 'package:chat_app/Widgets/status_list.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
//import 'package:flutter_class_010423/custom_widgets/whatsapp_chatlist.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => HomePageViewModel(),
      builder: (context, viewModel, child) {
        return DefaultTabController(
            initialIndex: 1,
            length: 4,
            child: Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                  backgroundColor: Colors.teal,
                  title: Text(viewModel.getcurrentuser().toString()),
                  bottom: const TabBar(
                    indicatorColor: Colors.white,
                    tabs: [
                      Flexible(
                        flex: 1,
                        child: Tab(
                          child: Icon(Icons.camera_alt),
                        ),
                      ),
                      Flexible(
                        flex: 2,
                        child: Tab(
                          text: 'Chats',
                        ),
                      ),
                      Flexible(
                        flex: 2,
                        child: Tab(
                          text: 'Status',
                        ),
                      ),
                      Flexible(
                        flex: 2,
                        child: Tab(
                          text: 'Contact',
                        ),
                      )
                    ],
                  ),
                  actions: [
                    const Icon(Icons.search),
                    const SizedBox(
                      width: 10,
                    ),
                    PopupMenuButton(
                      icon: const Icon(Icons.more_vert_rounded),
                      itemBuilder: (context) => [
                        PopupMenuItem(
                            value: 1,
                            child: TextButton(
                                onPressed: () => viewModel.getSignOut(context),
                                child: const Text('SignOut')))
                      ],
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                  ]),
              body: TabBarView(
                children: [
                  const Center(child: Text('Open Front Camera')),

//CHAT LIST VIEW
                  //const ChatPageView(),
                  const Center(child: Text('ChatList')),
//End CHAT LIST VIEW

// STATUS LIST VIEW
                  ListView(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          backgroundImage: const NetworkImage(
                              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTD1W9MJETPFK4hI2pwb1k7e7cqX-ie4fe_7Q&usqp=CAU'),
                          child: Container(
                              alignment: Alignment.bottomRight,
                              decoration: const BoxDecoration(
                                // color: Colors.teal,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                              ),
                              child: const Icon(
                                Icons.add,
                              )),
                        ),
                        title: const Text('My status'),
                        subtitle: const Text('Tap to add status update'),
                      ),
                      Container(
                          margin: const EdgeInsets.only(left: 15),
                          child: const Text('Recent updates')),
                      status_list(
                          name: 'Zuhaib School',
                          DateTime: DateTime.now(),
                          imageUrl:
                              'https://cdn.statusqueen.com/dpimages/thumbnail/cute_dp_image-3094.jpg'),
                      status_list(
                          name: 'DANISH',
                          DateTime: DateTime.now(),
                          imageUrl:
                              'https://yohohindi.com/wp-content/uploads/2022/11/sad-dp-yohohindi-18-768x768.jpg'),
                      status_list(
                          name: 'JAWAD',
                          DateTime: DateTime.now(),
                          imageUrl:
                              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR-32lv9ku3nAC0HvzrVwztgY18fJ9jJD2oXQ&usqp=CAU'),
                    ],
                  ),
// END STATUS LIST VIEW

//CALL List View Start
                   ContactView(viewModel: viewModel,)
// End Call list View
                ],
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  // Add your onPressed code here!
                },
                backgroundColor: Colors.teal,
                child: const Icon(Icons.chat),
              ),
            ));
      },
    );
  }
}
