import ../ppm_lib/ppm_toolkit

var ppmContent: string = ""

var imgWidth: int = 250
var imgHeight: int = 250

ppmContent.add(initHeader(3))
ppmContent.add(initImageSize(imgWidth, imgHeight))
ppmContent.add(initMaxColor(255))

for i in countup(0, imgHeight - 1):
    for j in countup(0, imgWidth - 1):
        ppmContent.add(genPixel(i, j, 0))

writeFile("img.ppm", ppmContent)