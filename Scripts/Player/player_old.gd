extends CharacterBody2D

func _process(delta: float) -> void:
	velocity.y += 1000 * delta

#
#var bullet_ready = true
#var dash_ready : bool = true
#
#@export var cooldown_bullet : int = 1
#@export var cooldown_dash : float = .5
#@export var bullet_scene: PackedScene
#@export var hook_scene: PackedScene
#
#@export var ACCELERATION : float = 0.1
#@export var DECCELERATION : float = 0.1
#@export var GRAVITY : int = 1000
#@export var JUMP_SPEED : int = -270
#@export var SPEED : int = 100
#var click_position = Vector2()
#var target_position = Vector2()
#
#func _ready() -> void:
	#position.x = Controller.Player_current_x_position
	#position.y = Controller.Player_current_y_position
	#$AnimatedSprite2D.play("Idle")
	#add_to_group("pausable")
#
#func _physics_process(delta: float) -> void:
##Shot
	#if Controller.is_die == false:
		#if Input.is_action_just_pressed("shot") and bullet_ready:
			#$ShotAudio.play()
			#shoot()
			#var current_bullet = Controller.Player_current_bullet
			#bullet_ready = false
			#var timer = get_tree().create_timer(cooldown_bullet)
			#timer.timeout.connect(func():
				#if is_instance_valid(self):
					#if current_bullet > 0:
						#bullet_ready = true
				#)
			#
#
	##Move
		#var direction = Input.get_axis("left", "right")
		#if direction:
			#velocity.x = lerp(velocity.x, SPEED * direction, ACCELERATION)
			#$AnimatedSprite2D.flip_h = direction < 0
			#if is_on_floor() and dash_ready == true:
				#$AnimatedSprite2D.play("Run")
		#else:
			#velocity.x = lerp(velocity.x, SPEED * direction, DECCELERATION)
			#$AnimatedSprite2D.play("Idle")
	##Dash
		#if Input.is_action_just_pressed("dash") and dash_ready:
			#$AnimatedSprite2D.play("Dash")
			#velocity.x = direction * 300
			#$DashAudio.play()
			#dash_ready = false
			#await get_tree().create_timer(cooldown_dash).timeout
			#dash_ready = true
			#
	#
		#velocity.y += GRAVITY*delta
	##Jump
		#if is_on_floor():
			#if Input.is_action_just_pressed("jump"):
				#$AnimatedSprite2D.play("Jump")
				#velocity.y = JUMP_SPEED
				#$JumpAudio.play()
	#else :
		#velocity.x = 0
		#velocity.y += GRAVITY*delta
		#$AnimatedSprite2D.play("Die")
	#move_and_slide()
#
#func shoot():
	#Controller.Bullet_change.emit("used", 1)
	#var bullet = bullet_scene.instantiate()
	#bullet.position = global_position
	#bullet.direction = (get_global_mouse_position() - global_position).normalized()
	#get_tree().current_scene.call_deferred("add_child", bullet)
#
#func hook():
	#pass
