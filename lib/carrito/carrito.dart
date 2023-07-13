import 'package:flutter/material.dart';
import 'package:integracion_app/widgets/item.dart';

class Carrito extends ChangeNotifier {
  Map<String, Item> _items = {};
  Map<String, Item> get items {
    return {..._items};
  }

  int get numeroItems {
    return _items.length;
  }

  void ordenarItems() {
  List<Item> itemList = _items.values.toList();

  // Ordenar los items por algún criterio (por ejemplo, por nombre)
  itemList.sort((a, b) => b.nombre.compareTo(a.nombre));

  // Actualizar el mapa de items con la lista ordenada
 // _items = Map.fromIterable(
//    itemList,
 //   key: (item) => item.id,
 //   value: (item) => item,
 // );

}

  double get subTotal {
    var total = 0.0;
    items.forEach(
        (key, elementos) => total += elementos.precio * elementos.cantidad);
    return total;
  }

  double get impuesto {
    var total = 0.0;
    total = subTotal * 0.19;
    return total;
  }

  double get total {
    var total = 0.0;
    total = subTotal + impuesto;
    return total;
  }

  void agregarItem(
    String producto_id,
    String nombre,
    double precio,
    String unidad,
    String imagen,
    int cantidad,
  ) {
    if (_items.containsKey(producto_id)) {
      _items.update(
          producto_id,
          (old) => Item(
              id: old.id,
              nombre: old.nombre,
              precio: old.precio,
              unidad: old.unidad,
              imagen: old.imagen,
              cantidad: old.cantidad + 1));
    } else {
      _items.putIfAbsent(
          producto_id,
          () => Item(
              id: producto_id,
              nombre: nombre,
              precio: precio,
              unidad: unidad,
              imagen: imagen,
              cantidad: 1));
    }
  }

  void removerItem(String producto_id) {
    _items.remove(producto_id);
  }

  void incrementarCantidadItem(String producto_id) {
    if (_items.containsKey(producto_id)) {
      _items.update(
          producto_id,
          (old) => Item(
              id: old.id,
              nombre: old.nombre,
              precio: old.precio,
              unidad: old.unidad,
              imagen: old.imagen,
              cantidad: old.cantidad + 1));
    }
  }

  void decrementarCantidadItem(String producto_id) {
    if (!_items.containsKey(producto_id)) return;
    if ((_items[producto_id]?.cantidad ?? 0) >= 1) {
      _items.update(
          producto_id,
          (old) => Item(
              id: old.id,
              nombre: old.nombre,
              precio: old.precio,
              unidad: old.unidad,
              imagen: old.imagen,
              cantidad: old.cantidad - 1));
    } else {
      items.remove(producto_id);
    }
    eliminarSiMenorAUno(producto_id);
  }

  void eliminarSiMenorAUno(String producto_id) {
    if (!_items.containsKey(producto_id)) return;
    if ((_items[producto_id]?.cantidad ?? 0) <= 0) {
      _items.remove(producto_id);
    }
  }
}

