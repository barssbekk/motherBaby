extends CharacterBody2D

@export var movement_speed: float = 70
var character_direction: Vector2
var is_born = false  # For birth animation
@export var health = 1  # Player health

func _ready() -> void:
	$AnimatedSprite2D.play("birth")  # Start birth animation
	$AnimatedSprite2D.connect("animation_finished", Callable(self, "_on_animation_finished"))

func _physics_process(delta: float) -> void:
	if not is_born:
		velocity = Vector2.ZERO
		move_and_slide()
		return

	character_direction.x = Input.get_axis("move_left", "move_right")
	character_direction.y = Input.get_axis("move_up", "move_down")

	# Flip the sprite
	if character_direction.x > 0:
		$AnimatedSprite2D.flip_h = false
	elif character_direction.x < 0:
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

# Player death with animation and delay
func die():
	health -= 1
	if health <= 0:
		print("Player died!")  # Debug message
		$AnimatedSprite2D.play("death")  # Play death animation
		set_process(false)
		set_physics_process(false)
		_restart_with_delay()

# Function to handle delay before restart
func _restart_with_delay():
	var timer = Timer.new()
	add_child(timer) 
	timer.wait_time = 2.0  # Set delay to 1 second
	timer.one_shot = true  # Make the timer fire only once
	timer.connect("timeout", Callable(self, "_on_restart_timer_finished"))
	timer.start()

# Restart the game after the delay
func _on_restart_timer_finished():
	restart_game()

# Restart the current scene
func restart_game():
	get_tree().reload_current_scene()
