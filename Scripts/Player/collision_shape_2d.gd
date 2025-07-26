extends CollisionShape2D

const GRAVITY : int = 2500
const JUMP_SPEED : int = 1000
const SPEED : int = 600

func _physics_process(delta: float) -> void:
	var direction = Input.get_axis("left", "right")
	velocity.x = direction * SPEED
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
