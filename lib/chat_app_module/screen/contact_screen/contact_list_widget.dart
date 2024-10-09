import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ContactListWidget extends StatefulWidget {
  @override
  _ContactListWidgetState createState() => _ContactListWidgetState();
}

class _ContactListWidgetState extends State<ContactListWidget> {
  List<ChatList> itemList = [
    ChatList(
      bgColor: Color(0x960200F0),
      color: Color(0xFFFFFFFF),
      title: "Freelance work",
      icon: FontAwesomeIcons.briefcase,
      statusTime: "Last seen 3 hours ago",
      imgSrc:
      "https://assets.capitalfm.com/2020/17/paul-mescal-normal-people-1588088181-view-1.png",
      hasStory: true,
      isActive: true,
    ),
    ChatList(
      bgColor: Color(0x960200F0),
      color: Color(0xFFFFFFFF),
      title: "Freelance work",
      icon: FontAwesomeIcons.briefcase,
      statusTime: "Online",
      imgSrc:
      "https://assets.capitalfm.com/2020/17/paul-mescal-normal-people-1588088181-view-1.png",
      hasStory: false,
      isActive: true,
    ),

  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: itemList.map((e) {
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: InkWell(
                onDoubleTap: () {},
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: e.hasStory == true ? Colors.blue : Colors.transparent, // Dynamic border color
                                  width: 2,
                                ),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.network(
                                  e.imgSrc ?? "",
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),

                            // Green active point

                            if (e.isActive == true)
                              Positioned(
                                right: 0,
                                top: 0,
                                child: Container(
                                  width: 12,
                                  height: 12,
                                  decoration: BoxDecoration(
                                    color: Colors.green,
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: Colors.white,
                                      width: 2,
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),

                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                e.title ?? "",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                e.statusTime ?? "",
                                style: TextStyle(fontSize: 14),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20,),
                    Divider(height: 1, color: Color(0x267D7D7D)),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}

class ChatList {
  final Color? bgColor;
  final Color? color;
  final String? title;
  final IconData? icon;
  final String? statusTime;
  final String? imgSrc;
  final bool? hasStory;
  final bool? isActive;

  ChatList({
    this.bgColor,
    this.color,
    this.title,
    this.icon,
    this.statusTime,
    this.imgSrc,
    this.hasStory,
    this.isActive,
  });
}