Ext.define 'teaurn.view.FavoriteViewer',
  extend: 'Ext.dataview.List'
  xtype: 'favoriteviewer'
  requires: [
    'teaurn.model.Favorite'
  ]
  config:
    layout: 'fit'
    itemTpl: [
      "<img src='{image}' height='20px'/>"
      "[{title}]"
      "<br/>"
      "{line}"
    ],
    store:
      autoLoad: true
      model: 'teaurn.model.Favorite'
