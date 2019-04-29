RectContainer = require './elements/Rects/RectCollectionView'
Rect = require './elements/Rect'
gsap = require 'gsap'

class App extends PIXI.Application
  animation:true
  animationNodes:[]
  rects: []
  collisionCheck: true

  constructor:(w,h,o)->
    super(w,h,o)
    document.body.appendChild @view
    window.addEventListener 'mousemove', @onMouseMove
    @build()
    @animate()

  onMouseMove: (evt) =>
    clientX = evt.clientX
    clientY = evt.clientY
    @rect.x = clientX - 10
    @rect.y = clientY - 10
    @rect.alpha = 0
  
  build:=>
    Wwidth = window.innerWidth
    Wheight = window.innerHeight
    @rectContainer = new RectContainer(@)
    @rect = new Rect()
    @stage.addChild @rect

  collision: (obj1, arr) =>
    return if obj1.alpha == 1
    
    for n in arr
      if (obj1.x < n.x + n.width && obj1.x + obj1.width > n.x)
        if (obj1.y < n.y + n.height && obj1.y + obj1.height > n.y)
          id = n
          console.log n.model.baseX
          gsap.TweenMax.to id, 1,
            width: 0
            x: id.model.baseX + id.model.width / 2
            onComplete:=>
                gsap.TweenMax.to id, 1,
                  width: window.innerWidth / 5
                  x: id.model.baseX




  
  addAnimationNodes:(child)=>
    @animationNodes.push child
    null

  animate:=>
    @ticker.add ()=>
      @collision(@rect, @rectContainer.children)
      for n in @animationNodes
        n.animate?()

    null

module.exports = App
