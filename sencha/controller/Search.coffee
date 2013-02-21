Ext.define 'teaurn.controller.Search'
  extend: 'Ext.app.Controller'
  requires: [
    'teaurn.view.SearchViewer'
    'teaurn.view.PhraseList'
  ]
  config:
    refs:
      field: 'searchfield'
      list: 'phraselist'
    control:
      field:
        keyup: 'onSearch'

  onSearch: (field,event)->
    if (event.event.keyCode != 13)
      return

    store = this.getList().getStore()

    store.load
      params:
        keyword:this.getField().getValue()
      callback: (records, operation, success)->
      scope:this
