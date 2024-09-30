import 'package:flutter/material.dart';
import 'package:skin/add/searchresult.dart';

class SearchScreen extends StatefulWidget {
  final String searchText;

  const SearchScreen({Key? key, required this.searchText}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _searchText = '';
  final List<String> _searchHistory = [
    'History Search 1',
    'History Search 2',
    'History Search 3',
    'History Search 4',
    'History Search 5',
  ];

  @override
  void initState() {
    super.initState();
    _searchText = widget.searchText; // Initialize with the passed search text
    _searchController.text = _searchText; // Set the text in the controller

    // Listener to update searchText on input change
    _searchController.addListener(() {
      setState(() {
        _searchText = _searchController.text;
      });
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _selectHistory(String search) {
    setState(() {
      _searchText = search;
      _searchController.text = search; // Update the search controller
    });
  }

  void _navigateToSearchResult() {
    if (_searchText.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SearchResultScreen(searchText: _searchText),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
  title: const Text('Search'),
  foregroundColor: Colors.white, // This sets the color of the text and icons
  backgroundColor: const Color.fromARGB(255, 16, 76, 179),
  leading: IconButton(
    icon: const Icon(
      Icons.arrow_back,
      color: Colors.white,
    ),
    onPressed: () {
      Navigator.pop(context);
    },
  ),
),


      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Search TextField
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search for products...',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide.none,
                ),
                prefixIcon: const Icon(Icons.search, color: Colors.grey),
              ),
              onSubmitted: (value) {
                _navigateToSearchResult();
              },
            ),
            const SizedBox(height: 16),
            // Search History
            const Text(
              'Search History',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: ListView.builder(
                itemCount: _searchHistory.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: const Icon(Icons.history),
                    title: Text(_searchHistory[index]),
                    trailing: const Icon(Icons.close),
                    onTap: () => _selectHistory(_searchHistory[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
