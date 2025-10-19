extends AnimatedSprite2D
@onready var player: CharacterBody2D = $".."

func getMovementDirection():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var input_direction = Input.get_vector("left", "right", "up", "down")
	
