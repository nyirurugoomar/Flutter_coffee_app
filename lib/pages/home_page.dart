import 'package:coffeeappui/util/coffe_type.dart';
import 'package:coffeeappui/util/coffee_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List coffeeType = [
    ['Cappucino', true],
    ['Late', false],
    ['Black', false],
    ['Americano', false],
    ['Flat White', false],
    ['Espresso', false],
    ['Cafe au Lait', false],
    ['Cafe Mocha', false]
  ];

  void coffeeTypeSelected(int index) {
    setState(() {
      for (var i = 0; i < coffeeType.length; i++) {
        if (i != index) {
          coffeeType[i][1] = false;
        }
      }
      coffeeType[index][1] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[900],
        appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            leading: Icon(Icons.menu),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: Icon(Icons.person),
              )
            ]),
        bottomNavigationBar: BottomNavigationBar(items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: '',
          )
        ]),
        body: Column(
          children: [
            //find the best coffee for your
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'Find the best coffee for you',
                style: GoogleFonts.bebasNeue(fontSize: 56),
              ),
            ),

            SizedBox(height: 25),
            //serch bar

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: TextField(
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    hintText: 'Find your coffee...',
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade600),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade600),
                    )),
              ),
            ),

            SizedBox(height: 25),

            //horizontal lisview of coffee types
            Container(
                height: 50,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: coffeeType.length,
                    itemBuilder: (context, index) {
                      return CoffeeType(
                        coffeeType: coffeeType[index][0],
                        isSelected: coffeeType[index][1],
                        onTap: () {
                          coffeeTypeSelected(index);
                        },
                      );
                    })),

            //horizontal listview of coffee ties
            Expanded(
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  CoffeeTile(
                    coffeeImagePath: 'lib/images/late.jpg',
                    coffeeName: 'Late',
                    coffeePrice: '4.50',
                  ),
                  CoffeeTile(
                    coffeeImagePath: 'lib/images/black.jpeg',
                    coffeeName: 'Black',
                    coffeePrice: '20.5',
                  ),
                  CoffeeTile(
                    coffeeImagePath: 'lib/images/capucino.jpg',
                    coffeeName: 'Capucino',
                    coffeePrice: '10.50',
                  ),
                  CoffeeTile(
                    coffeeImagePath: 'lib/images/tea.jpeg',
                    coffeeName: 'Tea',
                    coffeePrice: '40.50',
                  ),
                  CoffeeTile(
                    coffeeImagePath: 'lib/images/espresso.webp',
                    coffeeName: 'Espresso',
                    coffeePrice: '70.50',
                  ),
                ],
              ),
            )

            //
          ],
        ));
  }
}
