import 'package:flutter/material.dart';

class FeedsScreen extends StatelessWidget {
  const FeedsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Card(
              margin: EdgeInsets.all(10),
              elevation: 10,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  Image(
                    image: NetworkImage(
                        'https://img.freepik.com/free-photo/photo-overjoyed-hipster-looks-gladfully-away-points-fore-finger-blank-space_273609-25559.jpg?w=900&t=st=1702216902~exp=1702217502~hmac=c4d0b7d1ccbbaa81b7578b4f98e07f74fd84c556422d7ebc0347208f2e61039c'),
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                  Padding(
                    padding: EdgeInsets.all(7.0),
                    child: Text(
                      'Communicate with your friends ',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                  ),
                ],
              )),
          Card(
            elevation: 7,
            color: Colors.white,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 25,
                        backgroundImage: NetworkImage(
                            'https://img.freepik.com/free-photo/3d-rendering-ice-hockey-player_23-2150898762.jpg?t=st=1702306368~exp=1702309968~hmac=9cf561992fce46b219a185f768204cb8c84cd73bc0c74b9df9a1c45d3e881dc2&w=740'),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Row(
                            children: [
                              Text(
                                'Mahmoud Nassim',
                                style: TextStyle(
                                    height: 1.3,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Icon(
                                Icons.check_circle,
                                color: Colors.blue,
                              )
                            ],
                          ),
                          Text(
                            '11 December 2023',
                            style:
                                Theme.of(context).textTheme.bodySmall!.copyWith(
                                      height: 1.3,
                                    ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      IconButton(
                          onPressed: () {}, icon: const Icon(Icons.more_horiz)),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Container(
                      color: Colors.grey[400],
                      width: double.infinity,
                      height: 1,
                    ),
                  ),
                  Text(
                    'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting .',
                    style: TextStyle(
                      height: 1.3,
                      fontSize: 15,
                    ),
                  ),
                  Wrap(
                    children: [
                      Container(
                        height: 25,
                        child: MaterialButton(
                          height: 20,
                          padding: EdgeInsets.zero,
                          minWidth: 1,
                          onPressed: () {},
                          child: Text(
                            '#Flutter_Developer ',
                            style: TextStyle(color: Colors.blue),
                          ),
                        ),
                      ),                      
                      Container(
                        height: 25,
                        child: MaterialButton(
                          height: 20,
                          padding: EdgeInsets.zero,
                          minWidth: 1,
                          onPressed: () {},
                          child: Text(
                            '#Flutter_Developer ',
                            style: TextStyle(color: Colors.blue),
                          ),
                        ),
                      ),                      
                      Container(
                        height: 25,
                        child: MaterialButton(
                          height: 20,
                          padding: EdgeInsets.zero,
                          minWidth: 1,
                          onPressed: () {},
                          child: Text(
                            '#Flutter_Developer ',
                            style: TextStyle(color: Colors.blue),
                          ),
                        ),
                      ),                      
                      Container(
                        height: 25,
                        child: MaterialButton(
                          height: 20,
                          padding: EdgeInsets.zero,
                          minWidth: 1,
                          onPressed: () {},
                          child: Text(
                            '#Flutter_Developer ',
                            style: TextStyle(color: Colors.blue),
                          ),
                        ),
                      ),                      
                      Container(
                        height: 25,
                        child: MaterialButton(
                          height: 20,
                          padding: EdgeInsets.zero,
                          minWidth: 1,
                          onPressed: () {},
                          child: Text(
                            '#Flutter_Developer ',
                            style: TextStyle(color: Colors.blue),
                          ),
                        ),
                      ),                      
                    ],
                  ),
                  Container(
                    height: 120,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image:NetworkImage(
                          'https://img.freepik.com/free-photo/photo-overjoyed-hipster-looks-gladfully-away-points-fore-finger-blank-space_273609-25559.jpg?w=900&t=st=1702216902~exp=1702217502~hmac=c4d0b7d1ccbbaa81b7578b4f98e07f74fd84c556422d7ebc0347208f2e61039c'
                          ),
                           fit: BoxFit.cover
                        )
                    ),
                  )
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
