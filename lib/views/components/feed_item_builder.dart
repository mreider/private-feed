// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:private_feed/views/components/labels.dart';
import 'package:private_feed/views/pages/edit_message.dart';

import '../../utils/font_size.dart';

class FeedItemBuilder extends StatefulWidget {
  const FeedItemBuilder({Key? key}) : super(key: key);

  @override
  State<FeedItemBuilder> createState() => _FeedItemBuilderState();
}

class _FeedItemBuilderState extends State<FeedItemBuilder> {
  int _item = 5;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      separatorBuilder: (BuildContext context, int index) {
        return const Divider(
          thickness: 2,
        );
      },
      itemCount: _item,
      itemBuilder: (BuildContext context, int index) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  Icons.account_circle,
                  color: Colors.grey,
                ),
                SizedBox(
                  width: 10.5,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => EditMessage()));
                  },
                  child: Label(
                    text: 'Feed ${index + 1}',
                    fontSize: FontSize.p3,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => EditMessage()));
                  },
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
