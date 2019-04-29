gsap = require 'gsap'

class RectItemView extends PIXI.Graphics
    constructor: (model, container, app) ->
        super()
        @model = model
        @app = app
        @container = container
        @container.addChild(@)
        @build()

    build: () =>
        @interactive = true
        @beginFill(@model.color)
        @lineStyle(1, 0xffffff)
        @drawRect(0, 0, @model.width, @model.height)
        @x = @model.x
        @y = @model.y
        @id = @model.id
        @flipColor = @model.flipColor
        @endFill()
        @hitArea = new PIXI.Rectangle(@x, @y, @width, @height)
        @app.rects.push (@)

module.exports = RectItemView