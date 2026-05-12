extends CSGPolygon3D

@onready var placeholder_node = get_node("Placeholder")

enum Module {
	farm,
	drill
}

const _MODULE_MODEL_MAP = {
	Module.farm :	preload("res://models/basemodule_E.gltf"),
	Module.drill :	preload("res://models/drill_structure.gltf")
}

func _ready() -> void:
	set_module(Module.drill)


func set_color(color : Color) -> void:
	material.albedo_color = color


func set_module(module : Module) -> void:
	# remove any child if it exists
	if placeholder_node.get_child_count() != 0:
		placeholder_node.get_child(0).queue_free()
	
	placeholder_node.add_child(_MODULE_MODEL_MAP[module].instantiate())
	
