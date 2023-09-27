import 'package:flutter/material.dart';

class ScreenCategories extends StatelessWidget {
  const ScreenCategories({super.key}) ;

    @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Icon(
              Icons.apps,
              size: 40,
            ),
            SizedBox(width: 10.0),
            Text(
              'Category',
              style: TextStyle(fontSize: 40),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: Colors.grey[300],
            ),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Buscar',
                prefixIcon: Icon(Icons.search),
                border: InputBorder.none,
              ),
              onChanged: (value) {
                // Acción al cambiar el texto de búsqueda
              },
            ),
          ),
          Expanded(
            child: Center(
              child: GridView.count(
                crossAxisCount: 2,
                padding: EdgeInsets.all(20.0),
                childAspectRatio: 1.0,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Acción al presionar el botón
                    },
                    child: Text('Botón 1'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Acción al presionar el botón
                    },
                    child: Text('Botón 2'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Acción al presionar el botón
                    },
                    child: Text('Botón 3'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Acción al presionar el botón
                    },
                    child: Text('Botón 4'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}