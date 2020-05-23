import 'package:rxdart/rxdart.dart';
import '../model/item.dart';

enum CartEventType {
  add,
  remove,
}

class CartEvent {
  final CartEventType eventType;
  final Item item;

  CartEvent({this.eventType, this.item});
}

class CartBloc {
  final itemList = [
    Item(title: 'iMac', price: 1234567),
    Item(title: 'iPhone', price: 1234567),
    Item(title: 'iPad', price: 1234567),
    Item(title: 'AirPods', price: 1234567),
    Item(title: 'MacBook', price: 1234567),
  ];

  final _cartList = List<Item>();
  final _cartListSubject = BehaviorSubject<List<Item>>();

  Stream<List<Item>> get cartList => _cartListSubject.stream;

  void add(CartEvent event) {
    if (event.eventType == CartEventType.add) {
      _cartList.add(event.item);
    } else {
      _cartList.remove(event.item);
    }
    _cartListSubject.add(_cartList);
  }

  void dispose() {
    _cartListSubject.close();
  }
}
