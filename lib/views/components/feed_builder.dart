// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:private_feed/backend/feed_data.dart';
import 'package:private_feed/backend/model/auth_user.dart';
import 'package:private_feed/backend/model/feed.dart';
import 'package:private_feed/backend/user_data.dart';
import 'package:private_feed/utils/helper.dart';
import 'package:private_feed/views/components/labels.dart';
import 'package:private_feed/views/components/select_image_viewer.dart';

import '../../utils/all_colors.dart';
import '../../utils/font_size.dart';
import 'feed_like_comment.dart';

class FeedBuilder extends StatefulWidget {
  const FeedBuilder({Key? key}) : super(key: key);

  @override
  State<FeedBuilder> createState() => _FeedBuilderState();
}

String _profilePlaceholder = "assets/images/select_picture.svg";

class _FeedBuilderState extends State<FeedBuilder> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          SizedBox(
            height: 19,
          ),
          StreamBuilder(
            stream: FeedData().getAllFeeds(),
            builder:
                (BuildContext context, AsyncSnapshot<List<Feed>> snapshot) {
              List<Feed> feeds = snapshot.data ?? [];
              return ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                separatorBuilder: (BuildContext context, int index) {
                  return const Divider(
                    thickness: 2,
                  );
                },
                itemCount: feeds.length,
                itemBuilder: (BuildContext context, int index) {
                  Feed feed = feeds[index];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //Matt reider and edit section
                      StreamBuilder(
                        stream: UserData().getUser(id: feed.author),
                        builder: (BuildContext context,
                            AsyncSnapshot<AuthUser> snapshot) {
                          if (snapshot.data == null) {
                            return SizedBox();
                          }
                          AuthUser user = snapshot.data!;
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              user.imageUrl != null
                                  ? Image.network(
                                feed.imageUrl!,
                                fit: BoxFit.cover,
                              ):
                              Icon(
                                Icons.account_circle,
                                color: Colors.grey,
                              ),
                              SizedBox(
                                width: 10.5,
                              ),
                              Label(
                                text: user.fullName,
                                fontSize: FontSize.p2,
                                fontWeight: FontWeight.w500,
                              ),
                              Spacer(),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.edit,
                                  size: 16,
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      //Image Section
                      Container(
                        height: 326,
                        width: MediaQuery.of(context).size.width,
                        color: AllColors.grey,
                        child: feed.imageUrl == null
                            ? Center(
                                child: SvgPicture.asset(
                                  _profilePlaceholder,
                                  height: 100,
                                  width: MediaQuery.of(context).size.width,
                                  color: AllColors.darkGrey,
                                ),
                              )
                            : Image.network(
                                feed.imageUrl!,
                                fit: BoxFit.cover,
                              ),
                      ),
                      SizedBox(
                        height: 7.5,
                      ),
                      //post text section
                      Label(
                          fontSize: FontSize.p2,
                          fontWeight: FontWeight.w400,
                          text: feed.description),
                      SizedBox(
                        height: 10.5,
                      ),
                      //like section
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.favorite,
                                color: AllColors.danger,
                              ),
                              SizedBox(
                                width: 10.5,
                              ),
                              Label(
                                text: '${feed.getLikeIDs.length} Likes',
                                fontSize: FontSize.p2,
                                fontWeight: FontWeight.w400,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              ...feed.getLikeIDs
                                  .map((e) => SizedBox(
                                        width: 15,
                                        child: feedlikeWidget(
                                          icon: Icons.account_circle_outlined,
                                          color: AllColors.danger,
                                        ),
                                      ))
                                  .toList()
                            ],
                          ),
                          Row(
                            children: [
                              Label(
                                text: feed.createdAt.format(),
                                fontSize: FontSize.p4,
                                fontWeight: FontWeight.w500,
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      //comments section
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.comment,
                            color: AllColors.blue,
                          ),
                          SizedBox(
                            width: 10.5,
                          ),
                          Label(
                            text: ' Comments',
                            fontSize: FontSize.p2,
                            fontWeight: FontWeight.w400,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          ...feed.comments
                              .map(
                                (comment) => SizedBox(
                                  width: 15,
                                  child: feedcommentWidget(
                                    icon: Icons.account_circle_outlined,
                                    color: AllColors.danger,
                                  ),
                                ),
                              )
                              .toList()
                        ],
                      ),
                      SizedBox(
                        height: 26,
                      )
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
