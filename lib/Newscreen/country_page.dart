import 'package:chat_app/model/countrymodel.dart';
import 'package:flutter/material.dart';

class CountryPage extends StatefulWidget {
  const CountryPage({super.key, required this.setcountrydata});
  final Function setcountrydata;

  @override
  State<CountryPage> createState() => _CountryPageState();
}

class _CountryPageState extends State<CountryPage> {
  List<Countrymodel> countries = [
    Countrymodel(name: "India", code: "+91", flag: "🇮🇳"),
    Countrymodel(name: "Pakistan", code: "+92", flag: "🇵🇰"),
    Countrymodel(name: "Bangladesh", code: "+880", flag: "🇧🇩"),
    Countrymodel(name: "New zealand", code: "+64", flag: "🇳🇿"),
    Countrymodel(name: "england ", code: "+44", flag: "🇬🇧"),
    Countrymodel(name: "australia ", code: "+61", flag: "🇦🇺"),
    Countrymodel(name: "russia ", code: "+7", flag: "🇷🇺"),
    Countrymodel(name: "US", code: "+1", flag: "🇺🇸"),
    Countrymodel(name: "sri lanka", code: "+94", flag: "🇱🇰"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.teal,
          ),
        ),
        title: Text(
          'Choose a country',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w800,
            color: Colors.teal,
            wordSpacing: 1,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
                color: Colors.teal,
              ))
        ],
      ),
      body: ListView.builder(
          itemCount: countries.length,
          itemBuilder: (context, index) => card(countries[index])),
    );
  }

  Widget card(Countrymodel country) {
    return InkWell(
      onTap: () {
        widget.setcountrydata(country);
      },
      child: Card(
        margin: EdgeInsets.all(0.15),
        child: Container(
          height: 50,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: Row(
            children: [
              Text(country.flag.toString()),
              SizedBox(
                width: 18,
              ),
              Text(country.name.toString()),
              Expanded(
                  child: Container(
                      width: 130,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(country.code.toString()),
                        ],
                      )))
            ],
          ),
        ),
      ),
    );
  }
}
