import opengl
import boxy
import Windy

let windowSize = ivec2(300, 300)

let window = newWindow("PPM-Lib", windowSize)
makeContextCurrent(window)

loadExtensions()

let bxy = newBoxy()

var frame: int = 0 