extends MeshInstance3D

var speed = 5.0

func _process(delta):
	var direction = Vector3.ZERO

	if Input.is_action_pressed("ui_up"):    # W
		direction.z -= 1
	if Input.is_action_pressed("ui_down"):  # S
		direction.z += 1
	if Input.is_action_pressed("ui_left"):  # A
		direction.x -= 1
	if Input.is_action_pressed("ui_right"): # D
		direction.x += 1

	# 归一化方向向量并应用速度
	if direction != Vector3.ZERO:
		direction = direction.normalized() * speed * delta
		transform.origin += direction
