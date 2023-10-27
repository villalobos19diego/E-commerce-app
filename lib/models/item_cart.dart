class ItemCart{
  String id;
  String nombre;
  double precio;
  String unidad;
  String imagen;
  int cantidad;

  ItemCart({
    required this.id,
    required this.nombre,
    required this.precio,
    required this.unidad,
    required this.imagen,
    required this.cantidad
});

/*ItemCart.map(dynamic o){
    id = o["id"];
    nombre = o["nombre"];
    precio = o["precio"];
    unidad = o["unidad"];
    imagen = o["imagen"];
    cantidad = o['cantidad'];

  }*/

  Map<String, dynamic> toMap(){
    var map = new Map<String, dynamic>();
    map["id"] = id;
    map["nombre"] = nombre;
    map["precio"] = precio;
    map["unidad"] = unidad;
    map["imagen"] = imagen;
    map["cantidad"] = cantidad;
    return map;
  }

  Map<String,dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = this. id;
    data["nombre"] = this.nombre;
    data["precio"] = this.precio;
    data["unidad"] = this.imagen;
    data["imagen"] = this.imagen;
    data["cantidad"] = this.cantidad;

    return data;
  }


}