extends CanvasLayer


@onready var card_anchor_1 = $Control/cardAnchor
@onready var card_anchor_2 = $Control/cardAnchor2
@onready var card_anchor_3 = $Control/cardAnchor3
var card_scene_1 = preload("res://scenes/card_plus_baby.tscn")
var card_scene_2 = preload("res://scenes/card_plus_baby.tscn")
var card_scene_3 = preload("res://scenes/card_plus_atk.tscn")
var card_scene_4 = preload("res://scenes/card_plus_atk_range.tscn")
var card_scene_5 = preload("res://scenes/card_plus_atk_spd.tscn")
var card_scene_6 = preload("res://scenes/card_plus_baby_spd.tscn")
var card_scene_7 = preload("res://scenes/card_plus_mom_spd.tscn")
var card_scene_8 = preload("res://scenes/card_plus_life.tscn")
var card_scene_9 = preload("res://scenes/card_plus_baby_hp.tscn")



var cards = [
	card_scene_1,
	card_scene_2,
	card_scene_3,
	card_scene_4,
	card_scene_5,
	card_scene_6,
	card_scene_7,
	card_scene_8,
	card_scene_9,
]





func spawn_cards():
	card_anchor_1.add_child(cards[randi() % 9].instantiate())
	card_anchor_2.add_child(cards[randi() % 9].instantiate())
	card_anchor_3.add_child(cards[randi() % 9].instantiate())
	card_anchor_1.get_child(0).connect("pressed", close_cards)
	card_anchor_2.get_child(0).connect("pressed", close_cards)
	card_anchor_3.get_child(0).connect("pressed", close_cards)


func close_cards():
	get_tree().paused = false
	card_anchor_1.get_child(0).queue_free()
	card_anchor_2.get_child(0).queue_free()
	card_anchor_3.get_child(0).queue_free()
	







# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func plus_baby():
	get_parent().plus_baby()


func plus_mom_speed():
	get_parent().plus_mom_speed()


func baby_hp():
	get_parent().baby_hp()
