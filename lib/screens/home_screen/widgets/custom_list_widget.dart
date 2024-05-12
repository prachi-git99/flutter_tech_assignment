import 'package:flutter_tech_assignment/consts/consts.dart';

import '../../../model/user_model.dart';

Widget customListWidget(UserModel userList, String query) {
  final nameIndex = userList.name.toLowerCase().indexOf(query.toLowerCase());
  return Container(
    padding: const EdgeInsets.all(containerSmallPadding),
    margin: const EdgeInsets.only(top: verticalMargin),
    decoration: BoxDecoration(boxShadow: [
      BoxShadow(
          color: grey.withOpacity(0.3),
          spreadRadius: 1,
          blurRadius: 4,
          offset: const Offset(
              5, 5) // Adjust these values for bottom and right shadow
      )
    ], color: white, borderRadius: BorderRadius.circular(mediumBorderRadius)),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: const EdgeInsets.all(containerSmallPadding),
          decoration: BoxDecoration(
            color: pink,
            shape: BoxShape.circle,
            border: Border.all(color: white),
            boxShadow: [
              BoxShadow(
                  color: grey.withOpacity(0.9),
                  blurRadius: 1,
                  offset: const Offset(
                      0, 3) // Adjust these values for bottom and right shadow
              )
            ],
          ),
          child: Text(
            userList.getInitials(userList),
            style: const TextStyle(
                color: white,
                fontSize: mediumText,
                fontWeight: FontWeight.w500),
          ),
        ),
        const SizedBox(width: horizontalMargin),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  text: userList.name.substring(0, nameIndex),
                  style: const TextStyle(
                      fontSize: mediumText,
                      color: black,
                      fontWeight: FontWeight.w700),
                  children: [
                    TextSpan(
                      text: userList.name
                          .substring(nameIndex, nameIndex + query.length),
                      style: const TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: userList.name.substring(nameIndex + query.length),
                      style: const TextStyle(color: Colors.black),
                    ),
                  ],
                ),
              ),
              Text(
                userList.email,
                style: const TextStyle(
                    fontSize: smallText,
                    color: black,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
        )
      ],
    ),
  );
}
