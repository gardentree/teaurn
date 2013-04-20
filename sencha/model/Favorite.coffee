Ext.define 'teaurn.model.Favorite',
  extend: 'Ext.data.Model'
  config:
    fields: [
      'number'
      'title'
      'line'
      'image'
    ],
    proxy:
      type: 'localstorage'
      id: 'favorite'
