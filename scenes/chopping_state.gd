
extends NodeState

@export var player : Player
@export var animated_sprite_2d:AnimatedSprite2D
@export var hit_collision_shape : CollisionObject2D

func _on_process(_delta : float) -> void:
	hit_collision_shape.disable = true
	hit_collision_shape.position = Vector2(0,0);
	


func _on_physics_process(_delta : float) -> void:
	pass


func _on_next_transitions() -> void:
	if !animated_sprite_2d.is_playing():
		transition.emit("Idle")


func _on_enter() -> void:
	animated_sprite_2d.play("chopping")
	hit_collision_shape.position = Vector2(10,8)
	
	hit_collision_shape.disabled = false
	


func _on_exit() -> void:
	animated_sprite_2d.stop()
	hit_collision_shape.disabled = true
