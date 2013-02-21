Ext.define "teaurn.view.PhraseList"
  extend: 'Ext.dataview.List'
  xtype: 'phraselist'
  requires: [
    'teaurn.model.Phrase'
    'Ext.data.Store',
  ]
  config:
    itemTpl: [
      "<img src='{image}' height='20px'/>"
      "[{title}]"
      "<br/>"
      "{line}"
    ],
    store:
      autoLoad: false
      model: 'teaurn.model.Phrase'
