import ../ppm_lib/ppm_sprite

include ../gl/window

include triangle

var bg = createSprite(
    "assets/bg.sprite", "assets/bg.ppm", @[8, 8], 1, @[255, 255, 255]
)

var shader = ""

shader.add(initHeader(3))
shader.add(initImageSize(250, 250))
shader.add(initMaxColor(255))

for i in countup(0, 249):
    for j in countup(0, 249):
        shader.add(genPixel(i, j, 0))

writeFile("assets/colorSquare.ppm", shader)

bxy.addImage("bg", readImage(bg))
bxy.addImage("triangle", readImage("assets/triangle.ppm"))
bxy.addImage("square", readImage("assets/colorSquare.ppm"))

proc display() =
    bxy.beginFrame(windowSize)

    bxy.drawImage("bg", rect = rect(vec2(0, 0), windowSize.vec2))

    let center = windowSize.vec2 / 2 - 125
    bxy.drawImage("square", center)

    bxy.endFrame()
    window.swapBuffers()

    inc frame

while not window.closeRequested:
    display()
    pollEvents()