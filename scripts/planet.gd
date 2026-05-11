extends Node3D

@onready var _plots = get_node("Plots")
@onready var _skysphere : MeshInstance3D = get_node("Skysphere")

func set_skysphere(texture : Texture2D) -> void:
	_skysphere.mesh.material.albedo_texture = texture


# sets the color of the plots, and thus the planet
func set_color(color : Color) -> void:
	# create a material with the color
	var material : StandardMaterial3D = StandardMaterial3D.new()
	material.albedo_color = color
	
	# set each child
	for child : CSGPolygon3D in _plots.get_children():
		child.set_material(material)


func _process(delta: float) -> void:
	
	var x_axis = Input.get_axis("up", "down")
	var y_axis = Input.get_axis("left", "right")
	
	rotate_x(-x_axis * delta)
	rotate_y(-y_axis * delta)
