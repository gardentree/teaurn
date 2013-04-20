Ext.define 'teaurn.view.SearchViewer',
  extend: 'Ext.Container'
  xtype: 'searchviewer'
  requires: [
    'Ext.field.Search'
  ]
  config:
    layout: 'fit'
    items: [
      {
        extend: 'Ext.TitleBar'
        items: [
          {
            xtype: 'searchfield',
            placeHolder: 'Search...'
          }
        ]
        docked: 'top'
      }
      {
        xtype: 'phraselist'
      }
    ]
