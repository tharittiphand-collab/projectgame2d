extends NodeState

@export var Player:CharacterBody2D
@export var animated_sprite:AnimatedSprite2D

var direction:Vector2
func _on_process(_delta : float) -> void:
	pass


func _on_physics_process(_delta : float) -> void:
	if Input.is_action_just_pressed("left"):
		direction = Vector2.LEFT
	elif Input.is_action_just_pressed("right"):
		direction = Vector2.RIGHT
	elif Input.is_action_just_pressed("up"):
		direction = Vector2.UP
	elif Input.is_action_just_pressed("down"):
		direction = Vector2.DOWN
	else:
		direction = Vector2.ZERO
		
	animated_sprite.play("idle")		
func _on_next_transitions() -> void:
	pass


func _on_enter() -> void:
	pass


func _on_exit() -> void:
	pass
