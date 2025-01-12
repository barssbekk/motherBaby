extends CharacterBody2D

@export var movement_speed: float = 70
var character_direction: Vector2
var is_born = false  # For birth animation
var baby_scene = preload("res://scenes/baby2.tscn")
var mama_tear_scene = preload("res://scenes/mamaTear.tscn")
@onready var mama_tear_timer = $mamaTearTimer

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
	

func birth_baby():
	var babyinstance = baby_scene.instantiate()
	var spawn_position := self.position
	add_child(babyinstance)
	babyinstance.top_level = true
	babyinstance.position = spawn_position


func mama_tear_upgrade():
	var tearinstance = mama_tear_scene.instantiate()
	var spawn_position := self.position
	add_child(tearinstance)
	tearinstance.top_level = true
	tearinstance.position = spawn_position


func mama_tear_upgrade_pickup(area):
	if area.get_parent().name == "mamaTearUpgrade":
		mama_tear_timer.start()
		print("MAMA TEAR UPGRADE GOT")
