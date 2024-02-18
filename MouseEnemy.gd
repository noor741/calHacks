extends CharacterBody2D
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var theCat
var chase = false
var SPEED = 100

func _physics_process(delta):
	#Gravity for the mouse enemy
	velocity.y += gravity * delta
	if chase == true:
		theCat = get_node("../../theCat")
		var direction = ( theCat.position - self.position).normalized()
		if direction.x > 0 :
			get_node("MouseSprite").flip_h = false
		else:
			get_node("MouseSprite").flip_h = true
		velocity.x = direction.x * SPEED
	else:
		velocity.x = 0
	move_and_slide()
	
func _on_player_detection_body_entered(body):
	if body.name == "theCat":
		chase = true
		
		


func _on_player_detection_body_exited(body):
	if body.name == "theCat":
		chase = false


func _on_kill_the_cat_body_entered(body):
	if body.name == "theCat":
		self.queue_free()
