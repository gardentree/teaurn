Ext.define 'teaurn.view.Main'
  extend: 'Ext.tab.Panel'
  xtype: 'mainview'
  requires: [
    'teaurn.view.SearchViewer'
  ]
  config:
    tabBarPosition: 'bottom'
    items: [
      {
        title: 'Slide'
        xtype: 'slideviewer'
        iconCls: 'user'
      }
      {
        title: 'Search'
        xtype: 'searchviewer'
        iconCls: 'search'
      }
    ]
