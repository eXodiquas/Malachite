class Scene
    attr_accessor :actors

    def initialize(p, w, h)
        @background_path = p
        @actors = []

        Image.new(
            p,
            width: w,
            height: h,
            z: -1
          )
    end

    def add_actor(actor)
        @actors << actor
    end
end