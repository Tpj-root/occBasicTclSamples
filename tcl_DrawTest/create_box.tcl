# Script for creating a simple box model in OCCT
#Category: Modeling
#Title: OCCT Tutorial box shape

pload MODELING VISUALIZATION

puts "Constructing a box..."

# Set box dimensions
dset length 100
dset width 50
dset height 75

# Create a box
box b 0 0 0 length width height

# Display the box
vdisplay b
vfit
vsetdispmode 1
vaspects -isoontriangulation 1

puts "Box constructed and displayed."

