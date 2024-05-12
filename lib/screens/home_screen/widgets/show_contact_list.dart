import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tech_assignment/consts/consts.dart';
import 'package:flutter_tech_assignment/screens/home_screen/widgets/custom_list_widget.dart';
import '../../../bloc/home_bloc/home_bloc.dart';
import '../../../bloc/home_bloc/home_event.dart';
import '../../../bloc/home_bloc/home_state.dart';
import '../../../model/user_model.dart';

import '../../../repository/repo.dart';

Widget showContactList({searchController}) {
  return BlocProvider(
    create: (context) => HomeBloc(UserRepository())..add(LoadUserEvent()),
    child: Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: appHorizontalPadding, vertical: appVerticalPadding),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              homeScreenTitle,
              style: TextStyle(
                  fontSize: largeText,
                  color: black,
                  fontWeight: FontWeight.w700),
            ),
            BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                if (state is UserLoadingState) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is UserErrorState) {
                  return Center(child: Text(state.error));
                }
                if (state is UserLoadedState) {
                  List<UserModel> userList = state.users;
                  // Sort the list by the 'name'
                  userList.sort((a, b) => a.name.compareTo(b.name));

                  String query = searchController.text;
                  state.searchResults = userList
                      .where((item) =>
                          item.name.toLowerCase().contains(query.toLowerCase()))
                      .toList();

                  return ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      physics: const ScrollPhysics(),
                      itemCount: state.searchResults != []
                          ? state.searchResults.length
                          : userList.length,
                      itemBuilder: (context, index) {
                        return customListWidget(
                            state.searchResults == []
                                ? userList[index]
                                : state.searchResults[index],
                            query);
                      });
                }
                return Container();
              },
            )
          ],
        ),
      ),
    ),
  );
}
