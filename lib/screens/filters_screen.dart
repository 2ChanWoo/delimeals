import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';
  Map<String, bool> _filters;
  Function _setFilters;
  FiltersScreen(this._filters, this._setFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _lactoseFree = false;
  bool _vegetarian = false;
  bool _vegan = false;

  @override
  initState() {
    super.initState();
    _glutenFree = widget._filters['gluten'];
    _lactoseFree = widget._filters['lactose'];
    _vegetarian = widget._filters['vegetarian'];
    _vegan = widget._filters['vegan'];
  }

  Widget _buildSwitchListTile(String title, String description,
      int index) {
    bool switchValue;
    switch(index) {
      case 0 : switchValue = _glutenFree; break;
      case 1 : switchValue = _lactoseFree; break;
      case 2 : switchValue = _vegetarian; break;
      case 3 : switchValue = _vegan; break;
    }
    return SwitchListTile(
      title: Text(title),
      value: switchValue,
      subtitle: Text(description),
      onChanged: (_) {
        setState(() {
          switchValue = !switchValue;
          switch(index) {
            case 0 : _glutenFree = switchValue; print('_glutenFree $_glutenFree'); break;
            case 1 : _lactoseFree = switchValue; print('_lactoseFree $_lactoseFree'); break;
            case 2 : _vegetarian = switchValue; print('_vegetarian $_vegetarian'); break;
            case 3 : _vegan = switchValue; print('_vegan $_vegan'); break;
          }
        });
      },);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final selectedFilters = {
                'gluten': _glutenFree,
                'lactose': _lactoseFree,
                'vegan': _vegan,
                'vegetarian': _vegetarian,
              };
              widget._setFilters(selectedFilters);

              print(' ----- save -----');
              print('_glutenFree $_glutenFree');
              print('_lactoseFree $_lactoseFree');
              print('_vegetarian $_vegetarian');
              print('_vegan $_vegan');
              print(' ----------------');
            },
          )
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection.',
              style: Theme
                  .of(context)
                  .textTheme
                  .title,
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                _buildSwitchListTile(
                  'Gluten-free',
                  'Only include gluten-free meals.',
                  0,
                ),
                _buildSwitchListTile(
                  'Lactose-free',
                  'Only include lactose-free meals.',
                  1,
                ),
                _buildSwitchListTile(
                  'Vegetarian',
                  'Only include vegetarian meals.',
                  2,
                ),
                _buildSwitchListTile(
                  'Vegan',
                  'Only include vegan meals.',
                  3,
                )
              ],
            ),
          ),
        ],
      ),
    );;
  }
}
