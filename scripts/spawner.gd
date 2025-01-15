extends Marker2D

@export var mob_scene = preload("res://scenes/mob.tscn")
@export var difficulty_increase := 1.05
static var difficulty := 1.0
var spawning := false


func update_spawning_speed():
	get_child(1).wait_time /= difficulty_increase
	difficulty *= difficulty_increase
	#print(get_child(1).wait_time)




func _on_spawn_timer_timeout() -> void:
	if spawning == true:
		var instance = mob_scene.instantiate()
		var spawn_position := self.position
		add_child(instance)
		instance.top_level = true
		instance.position = spawn_position
		#print("Entity spawned at " + str(spawn_position))





func move_spawner():
	var tween = self.create_tween().set_loops()
	tween.tween_property(self, "position", Vector2(600, -600), 1.75)
	tween.tween_property(self, "position", Vector2(600, 600), 1.75)
	tween.tween_property(self, "position", Vector2(-600, 600), 1.75)
	tween.tween_property(self, "position", Vector2(-600, -600), 1.75)




func _on_start_spawning_timer_timeout() -> void:
	spawning = true
	print(self.name + " has been activated")


func exp_gained(amount):
	get_parent().exp_gained(amount)



func _ready() -> void:
	self.global_position = Vector2(-600, -600)
	move_spawner()
	update_spawning_speed()

func _process(delta: float) -> void:
	pass
