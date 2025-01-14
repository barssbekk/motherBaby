extends Node2D

@onready var mom_cam = $Player/Camera2D
@onready var baby_cam = $babyCamera/Camera2D

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
