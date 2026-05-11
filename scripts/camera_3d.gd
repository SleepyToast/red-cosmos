extends Camera3D

const DISTANCE = 6

var inclination: float = 0:
	get():
		return inclination
	set(value):
		inclination = value
		_calculate_position()

var azimuth: float = 0:
	get():
		return azimuth
	set(value):
		azimuth = value
		_calculate_position()

func _calculate_position() -> void:
	position.x = DISTANCE * sin(inclination) * cos(azimuth)
	position.y = DISTANCE * sin(inclination) * sin(azimuth)
	position.z = DISTANCE * sin(inclination)
	
	look_at(get_parent().get_node("Planet").position)


func _process(delta: float) -> void:
	azimuth += Input.get_axis("left", "right") * delta
	
	inclination += Input.get_axis("down", "up") * delta
