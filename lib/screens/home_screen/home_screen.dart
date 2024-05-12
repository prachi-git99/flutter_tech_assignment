import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tech_assignment/consts/consts.dart';
import 'package:flutter_tech_assignment/repository/repo.dart';
import 'package:flutter_tech_assignment/screens/home_screen/widgets/custom_searchBar.dart';
import 'package:flutter_tech_assignment/screens/home_screen/widgets/show_contact_list.dart';
import '../../bloc/home_bloc/home_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<HomeBloc>(
            create: (BuildContext context) => HomeBloc(UserRepository()),
          ),
        ],
        child: Scaffold(
            backgroundColor: Colors.grey.shade200,
            appBar: AppBar(
                elevation: 1,
                shadowColor: grey,
                //custom search bar widget
                title: customSearchBar(
                    searchController: searchController,
                    onClear: () {
                      setState(() {
                        searchController.clear();
                      });
                    },
                    onChanged: (value) {
                      setState(() {
                        searchController.text = value;
                      });
                    })),
            // list of contacts
            body: showContactList(searchController: searchController)));
  }
}
