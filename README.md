# Fireworks

This is a demo showing how to write animations using coroutines in pogoscript.

A coroutine is a function that yields periodically, giving up control to the caller of the function. So if the function animates a sprite, yielding allows other sprites to animate themselves, and for those sprites to be drawn on the canvas.

## Do not read the code!

Your brain will melt.

## (Read the code)

Because it might help you understand how continuations work.

In particular you probably want to read the `animate firework` object, the one containing all the calls to `yield!`.
