import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _SearchPage();
}

class _SearchPage extends State<SearchPage> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Search")),
      body: Column(children: [
        Container(
            padding: EdgeInsets.all(16),
            child: TextField(
              textInputAction: TextInputAction.search,
              onSubmitted: (value) {
                if (value.isEmpty) {
                  // Search
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(value),
                  ));
                }
              },
              controller: searchController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16))),
                hintText: 'Search',
                isDense: true,
                contentPadding: EdgeInsets.all(10),
                prefixIcon: Icon(CupertinoIcons.search, size: 20.0),
                suffixIcon: IconButton(
                  onPressed: () {
                    searchController.clear();
                  },
                  icon: Icon(Icons.clear, size: 20.0),
                ),
              ),
            ))
      ]),
    );
  }
}
