#!/bin/bash

module="logos"

here="$(dirname "$0")"
cd "$here"

module_singular="${module%?}"

d="./${module}"

fail() { echo fail; exit 1; }

pngdir=".build/pngs"
mkdir -p "$pngdir"


for s in 16 24 32; do
    #s=16
    out="./${module}$s.iuml"
    : > $out
    for svg in $d/*.svg; do
            name="$(basename "$svg" .svg)"
            ident="${module_singular}${s}_$(echo $name | tr '-' '_')"

            echo "$ident: $name :$s"

            png="$ident.png"
            trap "rm -f '$png'" EXIT

            svgexport "$svg" "$png" :$s || fail
            mogrify -background white -flatten "$png" || fail
            mogrify -grayscale Rec709Luminance -set colorspace sRGB -type TrueColor  -define 'png:format=png24' "$png" || fail
            java -Djava.awt.headless=true -jar ~/.plantuml/plantuml.1.2019.13.jar -encodesprite 16z "$png" >> $out || fail

            mv "$png" "$pngdir"

    done

done


