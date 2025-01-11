extends CharacterBody2D

@onready var player = get_node("/root/Game/Player")
@onready var animated_sprite = $AnimatedSprite2D
var is_chasing = false

func _physics_process(delta: float) -> void:
	
	var direction = global_position.direction_to(player.global_position)
	var distance = global_position.distance_to(player.global_position)
	
	# Handle chasing and movement 
	if distance < 110 and distance > 2: # Chasing distance 
		if not is_chasing:
			is_chasing = true
			print("Player detected!")
			animated_sprite.play("walk")
		velocity = direction * 30
	else: 
		if is_chasing: 
			is_chasing = false
			print("Player out the range")
			$AnimatedSprite2D.play("idle")
		velocity = Vector2.ZERO
	
	if velocity.x > 0 and distance > 2: 
		if animated_sprite.flip_h:
			animated_sprite.flip_h = false
	elif velocity.x < 0 and distance > 2: 
		if not animated_sprite.flip_h:
			animated_sprite.flip_h = true
	
	move_and_slide()
	



#Death Function called when health = 0
func die():
	queue_free()


func _on_damage_component_skeleton_attack() -> void:
	animated_sprite.play("attack")


func _on_hitbox_component_area_exited(area: Area2D) -> void:
	pass # Replace with function body.
