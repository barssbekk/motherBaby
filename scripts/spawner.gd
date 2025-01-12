extends Node2D

@onready var enemy = preload("res://scenes/ghost.tscn")


func _on_timer_timeout() -> void:
	var enemy_inst = enemy.instantiate() 
	enemy_inst.position = position # set default position
	get_parent().get_node("ghost").add_child(enemy_inst)
	print("Mob is spawned!")
