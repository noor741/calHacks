extends Sprite2D

var original_scale: Vector2

# Called when the node enters the scene tree for the first time.
func _ready():
	# Store the original scale of the sprite
	original_scale = scale

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# Check for arrow key input
	var horizontal_input = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")

	# Flip the sprite horizontally based on input
	if horizontal_input != 0:
		# Set the scale.x property to -1 to flip horizontally
		scale.x = original_scale.x * horizontal_input
	else:
		# Reset the scale to its original value when no input is detected
		scale = original_scale
