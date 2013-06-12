sprites = []

create firework (sprite) =
    sprites.push (sprite)

sprite index = 0

next sprite continuation = nil

yield! =
    sprites.(sprite index).next = continuation
    next sprite continuation ()

step! (index) =
    sprite index := index
    next sprite continuation := continuation
    if (sprites.(sprite index))
        try
            sprites.(sprite index).next (nil, nil)
                sprites.(index) = nil
                continuation ()
        catch (error)
            console.log (error)
    else
        try
            continuation ()
        catch (error)
            console.log (error)

animate firework (original x, original y, age) = {
    next! (error, result) =
        self.move (5, 0)
        yield!
        self.move (5, 0)
        yield!
        self.move (5, 0)
        yield!
        self.move (5, 0)

        self.explode!


        for (n = 0, n < 5, ++n)
            self.move (0, 5)
            yield!

        self.move right! ()

        yield!

    move right! () =
        yield!

    explode! =
        create firework (animate firework ((self.x + 1) % 250, self.y, age + 1))

    move (x, y) =
        self.x = self.x + x
        self.y = self.y + y

    x = original x
    y = original y
    colour = 'red'
}

set immediate! =
    set timeout (continuation, 0)

canvas =
    context = document.get element by id 'fireworks'.get context '2d'

    {
        draw sprite (sprite) =
            context.begin path ()
            context.arc (250 + sprite.x, 500 - sprite.y, 5, 0, 2 * Math.PI, false)
            context.fill style = sprite.colour
            context.fill ()

        clear () =
            context.clear rect (0, 0, 500, 500)
    }

there are some (sprites) =
    [s, where: s <- sprites, s].length > 0

animate! =
    while (there are some (sprites))
        set immediate!

        canvas.clear ()

        for (n = 0, n < sprites.length, ++n)
            sprite = sprites.(n)
            if (sprite)
                step! (n)
                canvas.draw sprite (sprite)

create firework (animate firework (0, 0))
animate!

console.log 'loop finished ok sam!'
