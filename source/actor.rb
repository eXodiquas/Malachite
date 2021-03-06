class Actor
    def initialize(sprite, x, y)
        @target_x = x
        @target_y = y
        @speed = 5 
        @image = Image.new(sprite, x: x, y: y)
    end

    def move(x, y)
        @target_x = x
        @target_y = y
    end

    def update 
        x_new = @target_x - @image.x
        y_new = @target_y - @image.y

        @image.x += @speed
        @image.y += @speed
    end
end