extends Control

var tween
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _gui_input(event):
	if event is InputEventMouseButton:
		print(event)
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				if tween:
					tween.kill() # 终止之前的补间动画。
				tween = get_tree().create_tween().set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_ELASTIC)
				tween.tween_property(self, "scale", Vector2(0.9, 0.9), 0.2) # 缩小
			elif !event.pressed:
				if tween:
					tween.kill() # 终止之前的补间动画。
				tween = get_tree().create_tween().set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_ELASTIC)
				tween.tween_property(self, "scale", Vector2(1.2, 1.2), 0.2) # 恢复原大小

func _on_mouse_entered() -> void:
	if tween:
		tween.kill() # 终止之前的补间动画。
	tween = get_tree().create_tween().set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_ELASTIC)
	tween.tween_property(self, "scale", Vector2(1.2,1.2), 0.5)

	print("entered")
	pass # Replace with function body.


func _on_mouse_exited() -> void:
	if tween:
		tween.kill() # 终止之前的补间动画。
	tween = get_tree().create_tween().set_ease(Tween.EASE_OUT)
	tween.tween_property(self, "scale", Vector2(1,1), 0.1)
	print("exited")
	pass # Replace with function body.
