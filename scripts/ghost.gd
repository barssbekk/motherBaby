extends CharacterBody2D

var exp_scene = preload("res://scenes/expCrystal.tscn")
@onready var player = get_node("/root/Game/Player")
@onready var animated_sprite = $AnimatedSprite2D
var is_chasing = false

func _physics_process(delta: float) -> void:
	
	var direction = global_position.direction_to(player.global_position)
	var distance = global_position.distance_to(player.global_position)
	
	# Handle chasing and movement 
	if distance < 2150 and distance > 2: # Chasing distance 
		if not is_chasing:
			is_chasing = true
			#print("Player detected!")
			animated_sprite.play("idle")
		velocity = direction * 40
	else: 
		if is_chasing: 
			is_chasing = false
			print("Player out the range")
			animated_sprite.play("idle")
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
	var instance = exp_scene.instantiate()
	var spawn_position := self.position
	get_parent().add_child(instance)
	instance.top_level = true
	instance.position = spawn_position
	instance.amount = 100
	queue_free()

func _on_damage_component_skeleton_attack() -> void:
	animated_sprite.play("attack")
	print("ghost attack animation")
