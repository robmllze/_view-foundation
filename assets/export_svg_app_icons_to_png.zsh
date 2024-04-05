
#!/bin/bash

# Define an array of output prefixes corresponding to your SVG files
OUTPUT_PREFIXES=("app_icon" "app_icon_foreground" "app_icon_background" "app_icon_maskable" "app_icon_background_maskable")

# Define an array of sizes
declare -a SIZES=("16" "32" "64" "128" "192" "256" "512" "768" "1024" "2048")

# Loop through each output prefix
for PREFIX in "${OUTPUT_PREFIXES[@]}"
do
    # Determine the SVG file name
    SVG_FILE="svg_icons/${PREFIX}.svg"
    
    # Check if SVG file exists
    if [[ -f "$SVG_FILE" ]]; then
        # Loop through the sizes and export each one
        for SIZE in "${SIZES[@]}"
        do
            DIR="icons/$PREFIX"
            # Create a directory for the output if it doesn't already exist
            mkdir -p "$DIR"
            # Export the PNG from the SVG
            inkscape "$SVG_FILE" --export-filename="$DIR/${PREFIX}_${SIZE}.png" --export-width="$SIZE" --export-height="$SIZE"
        done
        echo "Export complete for $SVG_FILE"
    else
        echo "File not found: $SVG_FILE"
    fi
done
