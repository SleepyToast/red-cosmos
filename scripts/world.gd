extends Node3D

@onready var planet : Node3D = get_node("Planet")


func _ready() -> void:
	planet.set_color(Color("b13e53"))
