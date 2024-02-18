extends Sprite2D

# Called when the node enters the scene tree for the first time.
func _ready():
	# Set the initial scale of the sprite
	scale = Vector2(1, 1)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# Check for arrow key input
	var horizontal_input = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")

	# Flip the sprite horizontally based on input
	if horizontal_input != 0:
		# Set the scale.x property to -1 to flip horizontally
		scale.x = abs(scale.x) * horizontal_input
