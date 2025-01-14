extends CharacterBody2D

@export var movement_speed : float = Stats.babyspeed + 10
var character_direction : Vector2
var mouse_position = null
var mouse_speed = 500
var mouse_activated : bool = false

func _physics_process(delta: float) -> void:
	character_direction.x = Input.get_axis("arrow_left", "arrow_right")
	character_direction.y = Input.get_axis("arrow_up", "arrow_down")
	
	if mouse_activated == true:
		mouse_position = get_global_mouse_position()
		self.position = mouse_position
	
	if Input.is_action_just_pressed("switch_baby_movement"):
		switch_baby_movement()
	
	
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

func switch_baby_movement():
	if mouse_activated == false:
		mouse_activated = true
	else:
		mouse_activated = false
