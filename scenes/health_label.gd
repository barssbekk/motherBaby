extends Label

var currenthealth : int = 1
signal died

func health_changed():
	currenthealth = Stats.lives
	self.text = str(calc())
	if currenthealth == 0:
		emit_signal("died")




func calc():
	return str(currenthealth) + "hp"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	health_changed()
