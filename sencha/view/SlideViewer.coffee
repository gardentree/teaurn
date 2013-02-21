Ext.define 'teaurn.view.SlideViewer',
  extend: 'Ext.Container'
  xtype: 'slideviewer'
  requires: [
    'Ext.Ajax'
    'Ext.carousel.Carousel'
    'Ext.Img'
  ]
  initialize: ->
    Ext.Ajax.request
      url: '/boys.json',
      success: (response) =>
        this.add this.createContainer(JSON.parse(response.responseText))
  createContainer: (boys)->
    verticals = []

    scroll = (index)->
      for vertical in verticals
        vertical.setActiveItem(index)

    createIndex = (phrases)->
      vertical = []
      index =
        xtype: 'container'
        layout: 'vbox'
        items: vertical

      i = 0
      for v in [0..4]
        horizon = []
        for h in [0..4]
          return index if i > (phrases.length - 1)
          phrase = phrases[i]
          i++

          horizon.push
            xtype: 'image'
            src: phrase.image
            width:64
            height:96
        vertical.push
          xtype: 'container'
          layout: 'hbox'
          items: horizon
      index

    for boy in boys
      images = []
      for phrase in boy.phrases
        images.push
          xtype: 'image'
          src: phrase.image

      index = createIndex(boy.phrases)

      verticals.push Ext.create 'Ext.carousel.Carousel'
        direction: 'horizontal'
        directionLock: true
        items: [index].concat(images)
        listeners:
          activeitemchange: (self,value,oldValue,event)->
            scroll(this.getActiveIndex())

    {
      xtype: 'carousel'
      direction: 'vertical'
      items: verticals
    }
  config:
    layout: 'fit'
