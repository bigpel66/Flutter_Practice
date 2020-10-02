<h1 align="center">provider_practice</h1>
<div align="center">
    The Project to Learn State Management with Provider
</div>

## What is this project?

This application is fetching posts and comments from the API that is provided by the Web Site. All of this project is maintaining the Architecture of Provider by injecting ViewModel as a state to the sub tree of Widget.

## Features

1. The data is provided from https://jsonplaceholder.typicode.com Web Site through Http Request.

2. The state of data that is given is implemented as similar as Scoped Model on the link https://github.com/bigpel66/flutter-practice/tree/master/FilledStack/scoped_model_practice because Provider is kind of additional version of Scoped Model.

3. This project is not dealing with the different features to the Scoped Model, only showing how to use Provider.

4. Views are using BaseView Class which has a Consumer Widget with template arguments to listen the change of BaseModel Class with template arguments.

5. Proivder Models are using BaseModel Class which is extending ChangeNotifier that is the implementation of Listenable to listen the notifyListeners method.

\*\* Project has been refactored regarding Providers & Route Path & Base Widgets.

\*\* MultiProvider is including StreamProvider, ProxyProvider, Provider.

\*\* Route Paths are integerated into a class

\*\* Widgets that have repetitive features are extending BaseWidget like BaseView for some Views.

## Demo

<div style="display:flex" align="center">
    <img src="images/1.gif" alt="1" width="250"/>
    <img src="images/2.gif" alt="2" width="250"/>
</div>
