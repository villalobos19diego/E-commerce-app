import 'package:e_commerce/models/item_cart.dart';
import 'package:flutter/material.dart';

class Carrito extends ChangeNotifier{
  Map<String ,ItemCart> _items = {};
  Map<String, ItemCart> get items{
    return {...items};
  }
  //metodo
  //conteo del numero de items en el carrito
  int get numeroItems{
    return _items.length;
  }

  //metodo
  //precio sub total de los productos en el carrito
  double get subTotal {
    var total = 0.0;
    items.forEach((key,elementos) => total += elementos.precio *elementos.cantidad);
    return total;
  }

  //metodo
  //impuesto que se agregara a cada producto
  double get impuestos{
    var total = 0.0;
    total = this.subTotal *0.18;
    return total;
  }

  //metodo
  //precio total a pagar de los productos

  double get total {
    var total = 0.0;
    total = this.subTotal *1.18;
    return total;
  }

  //metodo
  //agregar items 
  void agregarItem (
    String producto_id,
    String nombre,
    double precio,
    String unidad,
    String imagen,
    int cantidad,
  ){
    if(_items.containsKey(producto_id)){
      _items.update(
        producto_id,
        (old) => ItemCart(
          id:old.id, 
          nombre:old.nombre, 
          precio:old.precio, 
          unidad:old.unidad, 
          imagen:old.imagen,
          cantidad:old.cantidad+1
          )
      );
    }else{
      _items.putIfAbsent(
        producto_id,
           ()=>ItemCart(
            id: producto_id, 
            nombre: nombre, 
            precio: precio, 
            unidad: unidad, 
            imagen: imagen, 
            cantidad: 1
            )
        );
    }
  }

  //metodo para remover un item
  void  removerItem(String producto_id){
    _items.remove(producto_id);
  }

  //metodo para incrementar productos dentro del carrito
  void incrementarCantidadItem(String producto_id){
    if(_items.containsKey(producto_id)){
      _items.update(
        producto_id,
         (old) => ItemCart(
          id: old.id, 
          nombre: old.nombre, 
          precio: old.precio, 
          unidad: old.unidad, 
          imagen: old.imagen,
          cantidad: old.cantidad+1
      )
      );
    }
  }

  //metodo para decrementar productos dentro del carrito
  void decrementarCantidadItem(String producto_id){
    if(!_items.containsKey(producto_id)) return; //si el objeto no existe que de un return y termina 
    if(_items[producto_id]!.cantidad>1){
      _items.update(
        producto_id,
         (old) => ItemCart(
          id: old.id, 
          nombre: old.nombre, 
          precio: old.precio, 
          unidad: old.unidad, 
          imagen: old.imagen,
          cantidad: old.cantidad-1
       )
     );
    }else{
      _items.remove(producto_id); //eliminar el objeto
    }
  }

  //metodo eliminar todos los produtos del carrito
  void removeCarrito(){
    _items={};
  }
}