
import 'package:auto_complete_provider/models/user_models.dart';
import 'package:auto_complete_provider/provider/user_prov.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:provider/provider.dart';

class AdressView extends StatefulWidget {
  const AdressView({super.key});

  @override
  State<AdressView> createState() => _AdressViewState();
}

class _AdressViewState extends State<AdressView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Row(
                children: [
                  SvgPicture.asset('assets/icons/close.svg'),
                  const Spacer(),
                  const Text(
                    'Your Address',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 19,
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),
            const SizedBox(height: 50),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Enter your address',
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 10),
              ),
            ),
            Row(
              children: [
                Consumer<UsersProvider>(
                    builder: (_, UsersProvider userprov, __) {
                  return Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: TypeAheadField(
                        textFieldConfiguration: TextFieldConfiguration(
                          decoration: InputDecoration(
                            hintText: 'Ranch',
                            hintStyle: const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 15,
                              color: Colors.black,
                            ),
                            prefixIcon: Padding(
                              padding: const EdgeInsets.all(10),
                              child: SvgPicture.asset(
                                  'assets/icons/search-black.svg'),
                            ),
                            border: const OutlineInputBorder(),
                          ),
                        ),
                        suggestionsCallback: (value) {
                          List<Users> users = [];
                          users.addAll(userprov.user);
                          users.retainWhere(
                            (element) => element.address.city
                                .toUpperCase()
                                .contains(value.toUpperCase()),
                          );
                          return users;
                        },
                        itemBuilder: (context, Users suggestion) {
                          return Expanded(
                            child: Column(
                              children: [
                                Container(
                                    padding: const EdgeInsets.all(10),
                                    child: Row(
                                      children: [
                                        SvgPicture.asset(
                                            'assets/icons/localisation.svg'),
                                        Expanded(
                                          child: ListTile(
                                            title:
                                                Text(suggestion.address.city),
                                            subtitle:
                                                Text(suggestion.address.street),
                                          ),
                                        ),
                                      ],
                                    )),
                                Container(
                                  height: 0.5,
                                  width: double.infinity,
                                  color: Colors.grey,
                                ),
                              ],
                            ),
                          );
                        },
                        onSuggestionSelected: (Users st) {
                          //Todo
                        },
                      ),
                    ),
                  );
                }),
                Container(
                  width: 48,
                  height: 48,
                  margin: const EdgeInsets.only(bottom: 8),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                          blurRadius: 16,
                          offset: Offset(0, 8),
                          color: Colors.grey,
                        ),
                      ]),
                  child:
                      Center(child: SvgPicture.asset('assets/icons/path.svg')),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
