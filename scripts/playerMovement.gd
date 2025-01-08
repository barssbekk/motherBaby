extends CharacterBody2D

signal life_changed(player_hearts) 

@export var movement_speed : float = 50

var character_direction : Vector2
var max_hearts: int = 1 # the number of hearts 

func _physics_process(delta: float) -> void:
	character_direction.x = Input.get_axis("move_left", "move_right")
	character_direction.y = Input.get_axis("move_up", "move_down")
	
	# Flip
	if (character_direction.x > 0) :
		#%mamaSprite.flip_h = false
		pass
	elif (character_direction.x < 0): 
		#%mamaSprite.flip_h = true
		pass
	
	if character_direction.length() > 0:
		velocity = character_direction.normalized() * movement_speed
		#if %mamaSprite.animation != "Walking": %mamaSprite.animation = "Walking"
	else: 
		velocity = Vector2.ZERO
		#if %mamaSprite.animation != "Idle": %mamaSprite.animation = "Idle"
		
	move_and_slide()
