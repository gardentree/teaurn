Ext.define 'teaurn.model.Phrase',
  extend: 'Ext.data.Model'
  config:
    fields: [
      'number'
      'title'
      'line'
      'image'
    ],
    proxy:
      type: 'ajax'
      url: '/phrases/partial.json'
      reader:
        type: 'json'
