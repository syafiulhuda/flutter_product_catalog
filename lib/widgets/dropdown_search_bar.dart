import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';

class DropdownSearchBar extends StatelessWidget {
  final String selectedAddress;
  final List<String> addresses;
  final ValueChanged<String?> onAddressChanged;

  const DropdownSearchBar({
    super.key,
    required this.selectedAddress,
    required this.addresses,
    required this.onAddressChanged,
  });

  @override
  Widget build(BuildContext context) {
    double screenHorizontal = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.greenAccent,
          padding: EdgeInsets.symmetric(horizontal: screenHorizontal * 0.02),
          child: Row(
            children: [
              const Icon(Icons.maps_home_work),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  selectedAddress,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              IconButton(
                onPressed: () {
                  _showAddressPicker(context);
                },
                icon: const Icon(Icons.arrow_drop_down_circle_outlined),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showAddressPicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: DropdownSearch<String>(
            popupProps: const PopupProps.menu(
              showSelectedItems: true,
            ),
            items: addresses,
            dropdownDecoratorProps: const DropDownDecoratorProps(
              dropdownSearchDecoration: InputDecoration(
                labelText: "Select Address",
                hintText: "Choose an address",
              ),
            ),
            onChanged: (String? selectedAddress) {
              if (selectedAddress != null) {
                onAddressChanged(selectedAddress);
              }
              Navigator.pop(context);
            },
            selectedItem: selectedAddress,
          ),
        );
      },
    );
  }
}
