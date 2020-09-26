<h1 align="center">flutter_replaced_shop_app</h1>
<div align="center">
    The project to improve skills on nested state management by Provider
</div>

## Features

1. Navigating animation implemented and applied to the MaterialApp Widget.

2. MultiProvider has been used for Authentication, Cart, Order, Product. Related Providers are applied as a ChangeNotifierProxyProvider Widget.

3. Authentication Provider is using Firebase to get the Token for auto login. When the user get the Token from Firebase, the Token saved on the local storage by shared preferences.

4. If user does not have a Token, the user automatically logged out.

5. Custom Http Exception has been created to catch the Http Error precisely.

6. The user automatically logged out when the Token expires.

7. The data like Cart, Order, Product are using Firebase, but not Cloud Firestore.

8. Filtering by favorites are applied.

9. User interaction like snack bar, undo, fetching state ui for loading are implemented.

## Demo

<div style="display:flex" align="center">
    <img src="images/1.png" alt="1" width="200"/>
    <img src="images/2.png" alt="2" width="200"/>
    <img src="images/3.png" alt="3" width="200"/>
    <img src="images/4.png" alt="4" width="200"/>
    <img src="images/5.png" alt="5" width="200"/>
    <img src="images/6.png" alt="6" width="200"/>
    <img src="images/7.png" alt="7" width="200"/>
</div>
