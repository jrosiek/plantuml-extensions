#!/bin/bash

d="./octicons-svg"

#tmp="$(mktemp)"

fail() { echo fail; exit 1; }

pngdir="$d/png"
mkdir -p "$pngdir"


for s in 32; do
    #s=16
    out="octicons$s.iuml"
    : > $out
    for svg in $d/*.svg; do
            name="$(basename "$svg" .svg)"
            ident="octicon${s}_$(echo $name | tr '-' '_')"

            echo "$ident: $name :$s"

            png="$ident.png"


            svgexport "$svg" "$png" :$s || fail
            mogrify -background white -flatten "$png" || fail
            mogrify -grayscale Rec709Luminance -set colorspace sRGB -type TrueColor  -define 'png:format=png24' "$png" || fail
            java -jar ~/.plantuml/plantuml.1.2019.13.jar -encodesprite 16z "$png" >> $out || fail

            mv "$png" "$pngdir"

    done

done


