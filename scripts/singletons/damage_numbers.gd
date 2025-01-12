extends Node2D


func display_number(value: int, position : Vector2, is_critical: bool = false):
	var number = Label.new()
	number.global_position = position
	number.text = str(value)
	number.z_index = 5
	number.label_settings = LabelSettings.new()
	
	var color = "#FFD23F"
	if is_critical:
		color = "#D72638"
	if value == 0:
		color = "#FFF8"
	if value >= 2 and value < 4:
		color = "F46036"
	if value >= 6:
		color = "D72638"
	
	var font := preload("res://assets/fonts/MegamaxJonathanToo-YqOq2.ttf")
	number.label_settings.font = font
	number.label_settings.font_color = color
	number.label_settings.font_size = 11
	#number.label_settings.outline_color = "#000"
	#number.label_settings.outline_size = 1
	
	call_deferred("add_child", number)
	
	await number.resized
	number.pivot_offset = Vector2(number.size / 2)
	
	var tween = get_tree().create_tween()  #Scale and movement animations
	tween.set_parallel(true)
	tween.tween_property(number, "position:y", number.position.y - 24, 0.25).set_trans(Tween.TRANS_SPRING).set_ease(Tween.EASE_OUT)
	tween.tween_property(number, "position:y", number.position.y, 0.5).set_trans(Tween.TRANS_SPRING).set_ease(Tween.EASE_IN).set_delay(0.25)
	tween.tween_property(number, "scale", Vector2.ZERO, 0.25).set_trans(Tween.TRANS_SPRING).set_ease(Tween.EASE_IN).set_delay(0.5)
	tween.tween_property(number, "position:x", number.position.x + 24, 1.5).set_trans(Tween.TRANS_SPRING).set_ease(Tween.EASE_OUT)
	
	
	await tween.finished
	number.queue_free()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
