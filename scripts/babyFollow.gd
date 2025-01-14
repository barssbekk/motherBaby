extends CharacterBody2D

@export var baby : CharacterBody2D
@export var movement_speed : float = Stats.babyspeed
var pointer : CharacterBody2D


func _ready() -> void:
	pointer = get_tree().get_first_node_in_group("BabyPointer")

func _physics_process(delta: float) -> void:
	var direction = pointer.global_position - baby.global_position
	if direction.length() > 10:
		baby.velocity = direction.normalized() * movement_speed
	else:
		baby.velocity = Vector2()
		
	move_and_slide()
	
func die():
	queue_free()
