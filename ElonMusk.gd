extends CharacterBody2D
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var theCat
var chase = false
var SPEED = 200

func _physics_process(delta):
	# Gravity for ElonMusk enemy
	velocity.y += gravity * delta

	if chase:
		var theCat = get_node("theCat")  
		var direction = (theCat.global_position - global_position).normalized()

		if direction.x > 0:
			$MuskSprite.flip_h = false  # Use $ shortcut to reference child nodes directly
		else:
			$MuskSprite.flip_h = true

		velocity.x = direction.x * SPEED
	else:
		velocity.x = 0

	move_and_slide()

func _on_cat_detection_body_entered(body):
	if body.name == "theCat":
		chase = true


func _on_cat_detection_body_exited(body):
	if body.name == "theCat":
			chase = false



func _on_kill_the_cat_body_entered(body):
	if body.name == "theCat":
		self.queue_free()
