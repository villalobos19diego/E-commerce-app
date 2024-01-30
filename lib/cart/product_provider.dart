
class ProductProvider {
  final String id;
  final String name;
  final double price;
   late final String deliveryLocation;
   late final  String sizes ;
   final String image;
    String selectedLocation = ''; 
    String selectedSize = '';

  ProductProvider({
    required this.id, 
  required this.name, 
  required this.price,
  required this.deliveryLocation,
  required this.sizes,
  required this.image
  


  
  
  });
}