extends Node2D
class_name HealthComponent

@export var max_Health := 3
var current_Health : float


func damage(attack: Attack):
	current_Health -= attack.attack_damage
	
	if current_Health <= 0:
		get_parent().queue_free()


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	current_Health = max_Health


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
