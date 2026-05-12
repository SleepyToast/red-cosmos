extends Node3D

@onready var _skysphere : MeshInstance3D = get_node("Skysphere")

func set_skysphere(texture : Texture2D) -> void:
	_skysphere.mesh.material.albedo_texture = texture


# sets the color of the plots, and thus the planet
func set_color(color : Color) -> void:
	get_tree().call_group("plot", "set_color", color)


func _process(delta: float) -> void:
	
	var x_axis = Input.get_axis("up", "down")
	var y_axis = Input.get_axis("left", "right")
	
	rotate_x(-x_axis * delta)
	rotate_y(-y_axis * delta)
