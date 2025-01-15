extends Node2D

@export var attack_speed := 1.0
@export var new_attack_damage := 3
@export var max_attacks := 10 #maximum amount of attacks if you stay in range
var attacks_left := 10 #attacks you can make in current interaction
signal skeleton_attack

#Damage over time while in range
func _on_hitbox_component_area_entered(area: Area2D) -> void:
	attacks_left = max_attacks
	for attacks in attacks_left:
		if attacks_left != 0:
			if is_instance_valid(area):   #checks if attcked entity is still active, otherwise calling has_method will crash
				if area.has_method("damage"):  #will occasionaly crash if you dont check is_instance_valid()
					var attack = Attack.new()
					attack.attack_damage = new_attack_damage
					area.damage(attack)
					#print(get_parent().name + "'s attack did " + str(attack.attack_damage) + " damage!")
					attacks_left -= 1
					emit_signal("skeleton_attack")
					await get_tree().create_timer(attack_speed).timeout #delay between attacks

#Stop Damage over time when exitting range
func _on_hitbox_component_area_exited(area: Area2D) -> void:
	#print(get_parent().name + " left attack range.") 
	attacks_left = 0




func _ready() -> void:
	attacks_left = max_attacks
	

func _process(delta: float) -> void:
	pass


func _on_skeleton_attack() -> void:
	pass # Replace with function body.
