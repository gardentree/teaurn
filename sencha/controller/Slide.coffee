Ext.define 'teaurn.controller.Slide'
  extend: 'Ext.app.Controller'
  requires: [
    'teaurn.view.SlideViewer'
    'teaurn.model.Favorite'

  ]
  config:
    refs:
      slide: 'slideviewer'
      favorite: 'favoriteviewer'
    control:
      slide:
        favorite: 'onFavorite'

  onFavorite: (field,event)->
    event.id = String(event.number)
    favorite = Ext.create 'teaurn.model.Favorite',event

    Ext.Msg.alert(event.title,event.line,Ext.emptyFn)

    favorite.save()

    # this.getFavorite().getStore().sync()
    # this.getFavorite().refresh()
