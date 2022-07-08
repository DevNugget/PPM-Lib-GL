proc initHeader*(header: int): string =
    return "P" & $header & "\n" 

proc initImageSize*(width: int, height: int): string =
    return $width & " " & $height & "\n"

proc initMaxColor*(maxColor: int): string =
    return $maxColor & "\n"

proc genPixel*(r: int, g: int, b: int): string =
    return $r & " " & $g & " " & $b & "\n"