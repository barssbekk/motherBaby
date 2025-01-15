extends Control









func plus_baby():
	get_parent().plus_baby()

func plus_mom_speed():
	get_parent().plus_mom_speed()

func baby_hp():
	get_parent().baby_hp()





# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
