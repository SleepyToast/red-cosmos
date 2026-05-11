extends Node3D



func _process(delta: float) -> void:
	
	rotate_x(-Input.get_axis("up", "down") * delta)
	rotate_y(-Input.get_axis("left", "right") * delta)
