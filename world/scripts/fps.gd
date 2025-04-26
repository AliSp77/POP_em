extends Label
# Attach this to your Label node
func _process(delta):
	text = "FPS: %d" % Engine.get_frames_per_second()
