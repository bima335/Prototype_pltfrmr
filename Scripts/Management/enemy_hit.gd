class_name EnemyHit extends CharacterBody2D

var hp : int

func take_damage(damage:int) -> void:
	hp -= damage
	
	if hp <= 0:
		set_physics_process(false)
		call_deferred("queue_free")
