extends Node2D

@onready var mom_cam = $Player/Camera2D
@onready var baby_cam = $babyCamera/Camera2D
signal exp_gained_sig(amount: float)


func camera_switch():
	if mom_cam.enabled == true:
		mom_cam.enabled = false
		baby_cam.enabled = true
	else:
		mom_cam.enabled = true
		baby_cam.enabled = false
	

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("switch_camera"):
		camera_switch()


func exp_gained(amount):
	emit_signal("exp_gained_sig", amount)



func plus_baby():
	$Player.get_child(4).wait_time *= 0.7
	print($Player.get_child(4).wait_time)

func plus_mom_speed():
	$Player.movement_speed += 10

func baby_hp():
	pass
	

func choose_cards():
	$UI.spawn_cards()
