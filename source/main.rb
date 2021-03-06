require 'ruby2d'
load 'source/scene.rb'
load 'source/actor.rb'

WIDTH_CONST = 1280
HEIGHT_CONST = 720

set title: "Malachite Test Game", background: 'black', width: WIDTH_CONST, height: HEIGHT_CONST

scene = Scene.new 'assets/default.png', WIDTH_CONST, HEIGHT_CONST
scene.add_actor(Actor.new('assets/person.png', rand(1280), rand(720)))

tick = 1

update do
    if tick % 10 == 0
        print "\r#{(get :fps).truncate} FPS"
        scene.actors[0].move(rand(1280), rand(720))
    end
    scene.actors[0].update
    tick += 1
end

show
