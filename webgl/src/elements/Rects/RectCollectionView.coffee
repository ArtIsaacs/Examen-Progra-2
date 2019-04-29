Collection = require './RectCollection'
ItemView = require './RectItemView'

class RectCollectionView extends PIXI.Container
    collection: Collection
    constructor: (app) ->
        super()
        @app = app
        @app.stage.addChild(@)
        @buildItemView()

    buildItemView: () ->
        for model in @collection
            new ItemView(model, @, @app)

module.exports = RectCollectionView