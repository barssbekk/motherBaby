extends Node

var current_exp : float
var exp_required : float
var babyspeed := 80
var lives : float
signal exp_gained_sig(amount: float)

func exp_gained(amount: float):
	emit_signal("exp_gained_sig", amount)



func _ready() -> void:
	pass

func _process(delta: float) -> void:
	pass
