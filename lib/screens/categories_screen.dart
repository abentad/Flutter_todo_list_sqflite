import 'package:Flutter_todo_sqflite_app/models/categories.dart';
import 'package:Flutter_todo_sqflite_app/screens/home_screen.dart';
import 'package:Flutter_todo_sqflite_app/services/category_service.dart';
import 'package:flutter/material.dart';

class CategoriesScreen extends StatefulWidget {
  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  //text editing controllers
  TextEditingController _categoryNameController = TextEditingController();
  TextEditingController _descriptionNameController = TextEditingController();

  //category objects
  var _category = Category();
  var _categoryService = CategoryServices();

  //dialogue method for category
  _showFormDialog(BuildContext context) {
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (param) {
        return AlertDialog(
          actions: [
            FlatButton(
              onPressed: () {
                Navigator.pop(context);
              },
              color: Colors.red,
              child: Text("cancel"),
            ),
            FlatButton(
              onPressed: () {
                _category.name = _categoryNameController.text;
                _category.description = _descriptionNameController.text;
                _categoryService.saveCategory(_category);
              },
              color: Colors.blue,
              child: Text("save"),
            ),
          ],
          title: Text("Categories form"),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: _categoryNameController,
                  decoration: InputDecoration(
                    hintText: "write a category",
                    labelText: "Category",
                  ),
                ),
                TextField(
                  controller: _descriptionNameController,
                  decoration: InputDecoration(
                    hintText: "write a description",
                    labelText: "Description",
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: RaisedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomeScreen(),
              ),
            );
          },
          color: Colors.blue,
          elevation: 0.0,
          child: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        title: Text("Categories"),
      ),
      body: Center(
        child: Text("Welcome to categories screen."),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showFormDialog(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
