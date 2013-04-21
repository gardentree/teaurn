Ext.define 'teaurn.view.SlideViewer',
  extend: 'Ext.Container'
  xtype: 'slideviewer'
  requires: [
    'Ext.Ajax'
    'Ext.carousel.Carousel'
    'Ext.Img'
    'Ext.ux.PathMenu'
  ]
  initialize: ->
    Ext.Ajax.request
      url: '/boys.json',
      success: (response) =>
        this.add this.createContainer(JSON.parse(response.responseText))

        Ext.create 'Ext.ux.PathMenu',{
          bottom: 10,
          left: 10,
          items: [
            {
              iconCls: 'action',
              cardIndex: 0
            },
            {
              iconCls: 'add',
              cardIndex: 1
            },
            {
              iconCls: 'compose',
              cardIndex: 2
            },
            {
              iconCls: 'home',
              cardIndex: 3
            },
            {
              iconCls: 'refresh',
              cardIndex: 4
            }
          ]
        }

  createContainer: (boys)->
    self = this
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
            phrase:phrase
            listeners:
              tap: ->
                self.fireEvent 'favorite',this,this.phrase
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

      verticals.push Ext.create 'Ext.carousel.Carousel',
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
