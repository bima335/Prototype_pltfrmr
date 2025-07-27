extends CharacterBody2D

var bullet_ready : bool = true
@export var cooldown_bullet : int = 1
@export var bullet_scene: PackedScene
@export var hook_scene: PackedScene

@export var ACCELERATION : float = 0.1
@export var DECCELERATION : float = 0.1
@export var GRAVITY : int = 1500
@export var JUMP_SPEED : int = -270
@export var SPEED : int = 100
var click_position = Vector2()
var target_position = Vector2()

func _ready() -> void:
	position.y = 500

func _physics_process(delta: float) -> void:
#Shot
	if Input.is_action_just_pressed("shot") and bullet_ready:
		shoot()
		bullet_ready = false
		await get_tree().create_timer(cooldown_bullet).timeout
		bullet_ready = true
#Hook
	if Input.is_action_just_pressed("hook"):
		hook()
#Move
	var direction = Input.get_axis("left", "right")
	if direction:
		velocity.x = lerp(velocity.x, SPEED * direction, ACCELERATION)
	else:
		velocity.x = lerp(velocity.x, SPEED * direction, DECCELERATION)
	
	velocity.y += GRAVITY*delta
#Jump
	if is_on_floor():
		if Input.is_action_just_pressed("jump"):
			velocity.y = JUMP_SPEED
			print(position)
	move_and_slide()

func shoot():
	var bullet = bullet_scene.instantiate()
	bullet.position = global_position
	bullet.direction = (get_global_mouse_position() - global_position).normalized()
	get_tree().current_scene.call_deferred("add_child", bullet)

func hook():
	pass
