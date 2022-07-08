import ppm_toolkit
import os

proc createSprite*(fileName: string, targetFile: string, size: seq, scale: int, bgColor: seq): string =
    # Generate a sprite with PPM pixel data
    var ppmSprite = ""
    ppmSprite.add(initHeader(3))
    ppmSprite.add(initImageSize(size[0] * scale, size[1] * scale))
    ppmSprite.add(initMaxColor(255))
    
    for line in lines(fileName):
        for i in countup(1, scale):
            for ch in line:
                if ch == '0':
                    for j in countup(1, scale):
                        ppmSprite.add(genPixel(bgColor[0], bgColor[1], bgColor[2]))
                else:
                    for j in countup(1, scale):
                        ppmSprite.add(genPixel(0, 0, 0))

    writeFile(targetFile, ppmSprite)
    return targetFile

proc createImage*(fileName: string, targetFile: string) =
    discard execShellCmd("python ppm_lib/ppm_to_png.py " & fileName & " " & targetFile)