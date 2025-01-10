extends Area2D

@export var health_component : HealthComponent

func _ready() -> void:
	connect("body_entered", Callable(self, "_on_body_entered"))
	
func _on_body_entered(body):
	if body.name == "Player":
		print("Player collided with mob")
		body.die()
	
func damage(attack: Attack):
	if health_component:
		health_component.damage(attack)

# Called when the node enters the scene tree for the first time.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
