extends Node2D

@export var new_attack_damage := 3
@export var max_attacks := 10 #maximum amount of attacks if you stay in range
@export var animated_sprite : animatedSprite
var attacks_left := 10 #attacks you can make in current interaction


#Damage over time while in range
func _on_hitbox_component_area_entered(area: Area2D) -> void:
	attacks_left = max_attacks
	while attacks_left > 0:
		if area.has_method("damage"):
			var attack = Attack.new()
			attack.attack_damage = new_attack_damage
			area.damage(attack)
				
			
			print(get_parent().name + "'s attack did " + str(attack.attack_damage) + " damage!")
			attacks_left -= 1
			#print(attacks_left + "attacks left.")
			await get_tree().create_timer(1.0).timeout #One second delay between attacks
			if animated_sprite: 
				animatedSprite.new().play("attack")
				
#Stop Damage over time when exitting range
func _on_hitbox_component_area_exited(area: Area2D) -> void:
	print(get_parent().name + " left attack range.") 
	attacks_left = 0




func _ready() -> void:
	attacks_left = max_attacks
	

func _process(delta: float) -> void:
	pass
