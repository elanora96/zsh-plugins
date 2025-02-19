# Supply a .pdf and a target .{image_extension}
# I kept forgetting the -colorspace arg so yeah
function pdf2img() {
  magick -density 300 -colorspace RGB "$@"
}

