class Rect extends PIXI.Graphics
    interactive: true

    constructor: () ->
        super()
        @build()

    build: () =>
        @beginFill(0x00ff00)
        @lineStyle(1, 0xffffff)
        @drawRect(0, 0, 10, 10)
        @x = 0
        @y = 0
        @endFill()

module.exports = Rect