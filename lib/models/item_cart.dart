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
    var map = <String, dynamic>{};
    map["id"] = id;
    map["nombre"] = nombre;
    map["precio"] = precio;
    map["unidad"] = unidad;
    map["imagen"] = imagen;
    map["cantidad"] = cantidad;
    return map;
  }

  Map<String,dynamic> toJson(){
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] =  id;
    data["nombre"] = nombre;
    data["precio"] = precio;
    data["unidad"] = imagen;
    data["imagen"] = imagen;
    data["cantidad"] = cantidad;

    return data;
  }


}