extends Control
@export var angle_x_max : float = 18.0
@export var angle_y_max : float = 18.0
var tween
var is_enter: bool = false;
func _on_mouse_entered() -> void:
	is_enter = true
	if tween:
		tween.kill() # 终止之前的补间动画。
	tween = get_tree().create_tween().set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_ELASTIC)
	tween.tween_property(self, "scale", Vector2(1.2,1.2), 0.5)
	pass # Replace with function body.



func set_tween_x_shader(value: int) -> void:
	self.material.set_shader_parameter("_rot_x",value)
func set_tween_y_shader(value: int) -> void:
	self.material.set_shader_parameter("_rot_y",value)
	
func _on_mouse_exited() -> void:
	is_enter = false
	if tween:
		tween.kill() # 终止之前的补间动画。
	tween = get_tree().create_tween().set_ease(Tween.EASE_OUT)
	tween.tween_property(self, "scale", Vector2(1,1), 0.1)
	var x = self.material.get_shader_parameter("_rot_x")
	var y = self.material.get_shader_parameter("_rot_y")

	var tween_shader = create_tween()
	tween_shader.tween_method(set_tween_x_shader, x, 0, 0.2)
	tween_shader.parallel().tween_method(set_tween_y_shader, y, 0, 0.2)



func _on_gui_input(event: InputEvent) -> void:
	if not event is InputEventMouseMotion : return
	if not is_enter : return
	var mouse_pos : Vector2 = get_local_mouse_position()
	var lerp_val_x: float = remap(mouse_pos.x,0,size.x,0,1) 
	var lerp_val_y: float = remap(mouse_pos.y,0,size.y,0,1) 
	var rot_x : float = clamp(lerp(-angle_x_max,angle_x_max,lerp_val_x),-angle_x_max,angle_x_max)
	var rot_y : float = clamp(lerp(-angle_y_max,angle_y_max,lerp_val_y),-angle_x_max,angle_x_max)

	self.material.set_shader_parameter("_rot_x",rot_x)
	self.material.set_shader_parameter("_rot_y",rot_y)
