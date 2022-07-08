import ../ppm_lib/ppm_toolkit

var triangleW = 250
var triangleH = 250

var ppmContent = ""

ppmContent.add(initHeader(3))
ppmContent.add(initImageSize(triangleW, triangleH))
ppmContent.add(initMaxColor(255))

var steepness = 2
var base = 1
var attempt = 1

var red = 255
var green = 0
var blue = 0

for i in countup(0, triangleH - 1):
    var hRange = (triangleW / 2).toInt - base
    var remainder = triangleW - hRange - base - base

    for j in countup(0, hRange - 1):
        ppmContent.add(genPixel(255, 255, 255))
    
    for k in countup(0, base - 1):
        ppmContent.add(genPixel(red, green, 0))
        if attempt > 0:
            ppmContent.add(genPixel(red, green, blue))
            if attempt < 90:
                blue += 1
            else:
                blue += 2
        else:
            ppmContent.add(genPixel(red, green, 0))

    for l in countup(0, remainder - 1):
        ppmContent.add(genPixel(255, 255, 255))    

    ppmContent.add("\n") 

    if attempt mod steepness == 0:
        base += 1

    attempt += 1

    if red > 0:
        red -= 1
    if green < 255 and attempt > 60:
        green += 1
    
    blue = 0

writeFile("assets/triangle.ppm", ppmContent)