import 'package:flutter/material.dart';

import 'custom_action_button.dart';

class CustomSearch extends StatefulWidget {
  final Function(String?) onSearch;
  const CustomSearch({
    super.key,
    required this.onSearch,
  });

  @override
  State<CustomSearch> createState() => _CustomSearchState();
}

class _CustomSearchState extends State<CustomSearch> {
  final TextEditingController _searchController = TextEditingController();
  String _lastValue = '';

  @override
  void initState() {
    _searchController.addListener(() {
      setState(() {});
      // if (_searchController.text.trim().isEmpty && _lastValue.isNotEmpty) {
      //   widget.onSearch(null);
      //   _lastValue = '';
      // }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            controller: _searchController,
            obscureText: false,
            decoration: const InputDecoration(
              fillColor: Colors.white,
              filled: true,
              contentPadding: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
              border: InputBorder.none,
              hintText: 'Search',
            ),
          ),
        ),
        if (_searchController.text.trim().isNotEmpty)
          const SizedBox(
            width: 15,
          ),
        _searchController.text.trim().isNotEmpty
            ? CustomActionButton(
                iconData: Icons.search,
                onPressed: () {
                  _lastValue = _searchController.text.trim();
                  widget.onSearch(_lastValue);
                  setState(() {});
                },
                label: 'Search',
              )
            : const SizedBox(),
        if (_searchController.text.trim().isNotEmpty)
          const SizedBox(
            width: 15,
          ),
        _lastValue.isNotEmpty
            ? CustomActionButton(
                iconData: Icons.clear,
                onPressed: () {
                  _lastValue = '';
                  _searchController.clear();
                  widget.onSearch(null);
                  setState(() {});
                },
                label: 'Clear',
                color: Colors.grey,
              )
            : const SizedBox(),
      ],
    );
  }
}
