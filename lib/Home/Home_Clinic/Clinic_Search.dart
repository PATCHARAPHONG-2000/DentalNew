import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ClinicSearch extends StatefulWidget {
  const ClinicSearch({Key? key}) : super(key: key);

  @override
  State<ClinicSearch> createState() => _ClinicSearchState();
}

class _ClinicSearchState extends State<ClinicSearch> {
  List _allResults = [];
  List _resultList = [];
  List<Widget> widgets = [];

  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    _searchController.addListener(_onSearchChanged);
    super.initState();
  }

  _onSearchChanged() {
    searchResultList();
  }

  searchResultList() {
    var showResults = [];
    if (_searchController.text != "") {
      for (var clientSnapshot in _allResults) {
        var name = clientSnapshot['name'].toString().toLowerCase();
        if (name.contains(_searchController.text.toLowerCase())) {
          showResults.add(clientSnapshot);
        }
      }
    } else {
      showResults = List.from(_allResults);
    }
    setState(() {
      _resultList = showResults;
    });
  }

  getClientStream() async {
    var data = await FirebaseFirestore.instance
        .collection('Dental_Clinic')
        .orderBy('name')
        .get();

    setState(() {
      _allResults = data.docs;
    });

    searchResultList();
  }

  @override
  void didChangeDependencies() {
    getClientStream();
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CupertinoSearchTextField(
          controller: _searchController,
          itemColor: Theme.of(context).cardColor,
        ),
      ),
      body: _resultList.isEmpty
          ? Center(
              child: CircularProgressIndicator(
                  color: Theme.of(context).hoverColor),
            )
          : ListView.builder(
              itemCount: _resultList.length,
              itemBuilder: (context, int index) {
                var clinicSnapshot = _resultList[index];

                return GestureDetector(
                  onTap: () {},
                  child: ListTile(
                    title: Text(
                      clinicSnapshot['name'],
                      style: TextStyle(color: Theme.of(context).cardColor),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
