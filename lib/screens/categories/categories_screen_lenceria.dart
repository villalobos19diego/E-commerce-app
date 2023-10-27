import 'package:e_commerce/data/data_products_lenceria.dart';
import 'package:flutter/material.dart';

class CategoriesScreenLenceria extends StatelessWidget {
  const CategoriesScreenLenceria({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lencería'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(10),
              child: GridView.builder(
                itemCount: lenceria.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: MediaQuery.of(context).size.width / (MediaQuery.of(context).size.height / 1.1),
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 2,
                ),
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.all(4),
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 225, 172, 255),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                         BoxShadow(
                          color: Colors.transparent,
                          blurRadius: 30,
                          offset: Offset(10,10)
                         )
                      ]
                    ),
                    child: Column(
                      children: <Widget>[
                        Image.asset(lenceria[index].image),
                        Text(lenceria[index].title, style: TextStyle(fontWeight: FontWeight.bold)),
                        Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: Text("S/.${lenceria[index].price}", style: TextStyle(fontSize: 16),),
                        )

                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}