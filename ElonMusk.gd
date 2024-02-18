extends CharacterBody2D

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var theCat
var chase = false
var SPEED = 150
var jump_timer = 0
var jump_interval_min = 0.5  
var jump_interval_max = 1.0

func _physics_process(delta):
	# gravity for Elon Musk
	velocity.y += gravity * delta
	if chase == true:
		theCat = get_node("../../theCat")
		var direction = (theCat.position - self.position).normalized()
		if direction.x > 0:
			get_node("MuskSprite").flip_h = true
		else:
			get_node("MuskSprite").flip_h = false
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

func jump():
	velocity.y -= 500  
	jump_timer = randf_range(jump_interval_min, jump_interval_max)


func _on_kill_the_cat_body_entered(body):
	if body.name == "theCat":
		body.health -= 5
		print(body.health)



func _on_death_by_cat_body_entered(body):
	if body.name == "theCat":
		queue_free()
		
