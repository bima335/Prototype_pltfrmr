extends CharacterBody2D

var bullet_ready : bool = true
var dash_ready : bool = true

@export var cooldown_bullet : int = 1
@export var cooldown_dash : float = .5
@export var bullet_scene: PackedScene
@export var hook_scene: PackedScene

@export var ACCELERATION : float = 0.1
@export var DECCELERATION : float = 0.1
@export var GRAVITY : int = 1000
@export var JUMP_SPEED : int = -270
@export var SPEED : int = 100
var click_position = Vector2()
var target_position = Vector2()

func _ready() -> void:
	position.y = 500
	$AnimatedSprite2D.play("Idle")

func _physics_process(delta: float) -> void:
#Shot
	if Input.is_action_just_pressed("shot") and bullet_ready:
		shoot()
		bullet_ready = false
		await get_tree().create_timer(cooldown_bullet).timeout
		bullet_ready = true

#Move
	var direction = Input.get_axis("left", "right")
	if direction:
		velocity.x = lerp(velocity.x, SPEED * direction, ACCELERATION)
		$AnimatedSprite2D.flip_h = direction < 0
		if is_on_floor():
			$AnimatedSprite2D.play("Run")
	else:
		velocity.x = lerp(velocity.x, SPEED * direction, DECCELERATION)
		$AnimatedSprite2D.play("Idle")
#Dash
	if Input.is_action_just_pressed("dash") and dash_ready:
		velocity.x = direction * 250
		dash_ready = false
		await get_tree().create_timer(cooldown_dash).timeout
		dash_ready = true

	velocity.y += GRAVITY*delta
#Jump
	if is_on_floor():
		if Input.is_action_just_pressed("jump"):
			$AnimatedSprite2D.play("Jump")
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
