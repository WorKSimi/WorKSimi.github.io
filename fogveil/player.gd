extends CharacterBody2D

const speed = 100

@onready var camera: Camera2D = $Camera2D

func _enter_tree():
	set_multiplayer_authority(int(str(name)))
	
func _ready():
	if is_multiplayer_authority(): camera.make_current()
	if !is_multiplayer_authority():
		$AnimatedSprite2D.modulate = Color.AZURE

func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed

func _physics_process(delta: float) -> void:
	if !is_multiplayer_authority():
		return
	
	get_input()
	move_and_slide()
