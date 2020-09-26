<h1 align="center">flutter_replaced_shop_app</h1>
<div align="center">
    The project to improve skills on nested state management by Provider
</div>

## Features

1. This project is also a very important project to refer to State Management by Provider. Each of the model is quite related to other models. In addition, the implemented authentication methods are important too.

2. Navigating animation implemented and applied to the MaterialApp Widget.

3. MultiProvider has been used for Authentication, Cart, Order, Product. Related Providers are applied as a ChangeNotifierProxyProvider Widget.

4. Authentication Provider is using Firebase to get the Token for auto login. When the user get the Token from Firebase, the Token is saved on the local storage by shared preferences.

5. If user does not have a Token, the user automatically logged out.

6. Custom Http Exception has been created to catch the Http Error precisely.

7. The user automatically logged out when the Token expires.

8. The data like Cart, Order, Product are using Firebase, but not Cloud Firestore.

9. Filtering by favorites are applied.

10. User interaction like snack bar, undo, fetching state ui for loading are implemented.

## Demo

<div style="display:flex" align="center">
    <img src="images/1.png" alt="1" width="180"/>
    <img src="images/2.png" alt="2" width="180"/>
    <img src="images/3.png" alt="3" width="180"/>
    <img src="images/4.png" alt="4" width="180"/>
    <img src="images/5.png" alt="5" width="180"/>
    <img src="images/6.png" alt="6" width="180"/>
    <img src="images/7.png" alt="7" width="180"/>
</div>
