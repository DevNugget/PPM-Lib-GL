from PIL import Image
import sys

im = Image.open(sys.argv[1])
txt = sys.argv[2]
im.save(txt) 