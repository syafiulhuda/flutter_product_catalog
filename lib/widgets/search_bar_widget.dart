// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class SeacrBarWidget extends StatelessWidget {
  final double screenHorizontal;
  final double screenVertical;
  final TextEditingController searchBarControler;
  final List<Widget>? trailing;
  final VoidCallback onSubmit;
  final VoidCallback onTapOut;

  const SeacrBarWidget({
    super.key,
    required this.screenHorizontal,
    required this.screenVertical,
    required this.searchBarControler,
    this.trailing,
    required this.onSubmit,
    required this.onTapOut,
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
      onSubmitted: (value) {
        onSubmit();
      },
      onTapOutside: (value) {
        onTapOut();
      },
    );
  }
}
