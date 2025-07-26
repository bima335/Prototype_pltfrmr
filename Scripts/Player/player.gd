extends CharacterBody2D

@export var GRAVITY : int = 1500
@export var JUMP_SPEED : int = -270
@export var SPEED : int = 100


func _physics_process(delta: float) -> void:
	var direction = Input.get_axis("left", "right")
	velocity.x = direction * SPEED
	velocity.y += GRAVITY*delta
	if is_on_floor():
		if Input.is_action_just_pressed("jump"):
			velocity.y = JUMP_SPEED
	move_and_slide()
