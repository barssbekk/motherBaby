extends Button




func _on_pressed() -> void:
	get_parent().plus_baby()
	print("pressed")
