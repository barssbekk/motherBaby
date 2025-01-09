extends CharacterBody2D

@export var movement_speed : float = 70
var character_direction : Vector2
var is_born = false # for Birth animation

func _ready() -> void: 
	$AnimatedSprite2D.play("birth") #Birth animation
	$AnimatedSprite2D.connect("animation_finished", Callable(self, "_on_animation_finished"))
	

func _physics_process(delta: float) -> void:
	
	if not is_born:
		velocity = Vector2.ZERO
		move_and_slide()
		return 

	character_direction.x = Input.get_axis("move_left", "move_right")
	character_direction.y = Input.get_axis("move_up", "move_down")
	
	# Flip
	if (character_direction.x > 0):
		$AnimatedSprite2D.flip_h = false
	elif (character_direction.x < 0): 
		$AnimatedSprite2D.flip_h = true
	
	# Set animation and movement
	if character_direction.length() > 0:
		velocity = character_direction.normalized() * movement_speed
		if $AnimatedSprite2D.animation != "run":
			$AnimatedSprite2D.play("run")
	else: 
		velocity = Vector2.ZERO
		if $AnimatedSprite2D.animation != "idle":
			$AnimatedSprite2D.play("idle")
			
	move_and_slide()
	
func _on_animation_finished():
	is_born = true
