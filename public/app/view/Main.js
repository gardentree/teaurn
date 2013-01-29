// Generated by CoffeeScript 1.4.0

Ext.define('teaurn.view.Main', {
  extend: 'Ext.Container',
  xtype: 'main',
  requires: ['Ext.Ajax', 'Ext.carousel.Carousel', 'Ext.Img'],
  initialize: function() {
    var _this = this;
    return Ext.Ajax.request({
      url: '/boys.json',
      success: function(response) {
        return _this.add(_this.createContainer(JSON.parse(response.responseText)));
      }
    });
  },
  createContainer: function(boys) {
    var boy, createIndex, images, index, phrase, scroll, verticals, _i, _j, _len, _len1, _ref;
    verticals = [];
    scroll = function(index) {
      var vertical, _i, _len, _results;
      _results = [];
      for (_i = 0, _len = verticals.length; _i < _len; _i++) {
        vertical = verticals[_i];
        _results.push(vertical.setActiveItem(index));
      }
      return _results;
    };
    createIndex = function(phrases) {
      var h, horizon, i, index, phrase, v, vertical, _i, _j;
      vertical = [];
      index = {
        xtype: 'container',
        layout: 'vbox',
        items: vertical
      };
      i = 0;
      for (v = _i = 0; _i <= 4; v = ++_i) {
        horizon = [];
        for (h = _j = 0; _j <= 4; h = ++_j) {
          if (i > (phrases.length - 1)) {
            return index;
          }
          phrase = phrases[i];
          i++;
          horizon.push({
            xtype: 'image',
            src: phrase.image,
            width: 64,
            height: 96
          });
        }
        vertical.push({
          xtype: 'container',
          layout: 'hbox',
          items: horizon
        });
      }
      return index;
    };
    for (_i = 0, _len = boys.length; _i < _len; _i++) {
      boy = boys[_i];
      images = [];
      _ref = boy.phrases;
      for (_j = 0, _len1 = _ref.length; _j < _len1; _j++) {
        phrase = _ref[_j];
        images.push({
          xtype: 'image',
          src: phrase.image
        });
      }
      index = createIndex(boy.phrases);
      verticals.push(Ext.create('Ext.carousel.Carousel', {
        direction: 'horizontal',
        directionLock: true,
        items: [index].concat(images),
        listeners: {
          activeitemchange: function(self, value, oldValue, event) {
            return scroll(this.getActiveIndex());
          }
        }
      }));
    }
    return {
      xtype: 'carousel',
      direction: 'vertical',
      items: verticals
    };
  },
  config: {
    fullscreen: true,
    layout: 'fit'
  }
});
