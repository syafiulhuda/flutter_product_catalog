import 'package:flutter/material.dart';

class SeacrBarWidget extends StatelessWidget {
  final double screenHorizontal;
  final double screenVertical;
  final TextEditingController searchBarControler;
  final List<Widget>? trailing;

  const SeacrBarWidget({
    super.key,
    required this.screenHorizontal,
    required this.screenVertical,
    required this.searchBarControler,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      constraints: BoxConstraints(
        maxWidth: screenHorizontal * 1.0,
        maxHeight: screenVertical * 0.05,
      ),
      shape: WidgetStatePropertyAll(
        BeveledRectangleBorder(
          borderRadius: BorderRadius.circular(screenHorizontal * 0.01),
        ),
      ),
      controller: searchBarControler,
      hintText: "Search something :v",
      trailing: trailing,
    );
  }
}
