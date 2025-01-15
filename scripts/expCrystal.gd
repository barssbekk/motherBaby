extends Node2D

var amount := 10

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_hitbox_component_area_entered(area: Area2D) -> void:
	get_parent().exp_gained(amount)
	queue_free()
