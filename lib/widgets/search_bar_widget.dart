import 'package:flutter/material.dart';

class SeacrBarWidget extends StatelessWidget {
  final double screenHorizontal;
  final TextEditingController searchBarControler;
  final List<Widget>? trailing;

  const SeacrBarWidget({
    super.key,
    required this.screenHorizontal,
    required this.searchBarControler,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: screenHorizontal * 0.02,
      ),
      child: SearchBar(
        constraints: BoxConstraints(maxWidth: screenHorizontal * 0.9),
        controller: searchBarControler,
        hintText: "Search something :v",
        trailing: trailing,
      ),
    );
  }
}
