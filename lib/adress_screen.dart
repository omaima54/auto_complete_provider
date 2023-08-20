
import 'package:auto_complete_provider/adress_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../services/respsitory.dart';





class AdressScreen extends StatefulWidget {
  const AdressScreen({Key? key}) : super(key: key);

  @override
  State<AdressScreen> createState() => _AdressScreenState();
}

class _AdressScreenState extends State<AdressScreen> {
  Repository repository = Repository();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(_callApi);
  }

  _goToNextPage() {
    Navigator.of(context).pushReplacement(CupertinoPageRoute(
      builder: (_) => const AdressView(),
    ));
  }

  _callApi(_) {

    repository.fetchUsers(context);
    _goToNextPage();


  }

  @override
  Widget build(BuildContext context) {
    return const Material(
      color: Colors.red,
    );
  }
}
