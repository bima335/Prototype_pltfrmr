extends "res://Scripts/Management/enemy_hit.gd"

@export var bullet_scene : PackedScene
@export var cooldown_bullet : float = 1.0

var bullet_ready : bool = true
var can_attack : bool = false


func _ready() -> void:
	add_to_group("pausable")
	add_to_group("enemies")
	hp = 30

func _process(delta: float) -> void:
	$AnimatedSprite2D.play("default")
	
	if can_attack:
		if bullet_ready:
			shoot()
			bullet_ready = false
			await get_tree().create_timer(cooldown_bullet).timeout
			bullet_ready = true
			
	

func shoot():
	if Controller.is_die == false:
		var bullet = bullet_scene.instantiate()
		bullet.position.x = global_position.x -5
		bullet.position.y = global_position.y + 7
		bullet.direction = ($"../Player".position - global_position).normalized()
		get_tree().current_scene.call_deferred("add_child", bullet)

func _on_area_2d_body_entered(body: Node2D) -> void:
	can_attack = true

func _on_area_2d_body_exited(body: Node2D) -> void:
	can_attack = false
