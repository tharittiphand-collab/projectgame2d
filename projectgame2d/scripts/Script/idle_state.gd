extends NodeState

@export var Player:CharacterBody2D
@export var animated_sprite_2d:AnimatedSprite2D

var direction:Vector2
func _on_process(_delta : float) -> void:
	pass


func _on_physics_process(_delta: float) -> void:
	direction = GameInputEvents.movement_input()

	if direction == Vector2.ZERO:
		animated_sprite_2d.play("idle")
	else:
		animated_sprite_2d.stop()
		
func _on_next_transitions() -> void:
	GameInputEvents.movement_input()
	
	if GameInputEvents.is_movement_input():
		transition.emit("Walk")
	
	if Player.current_tool == DataTypes.Tools.Axe && GameInputEvents.use_tool():
		transition.emit("Chopping")	
		
	if Player.current_tool == DataTypes.Tools.Shovel && GameInputEvents.use_tool():
		transition.emit("Shovel")	
		
	if Player.current_tool == DataTypes.Tools.Watering && GameInputEvents.use_tool():
		transition.emit("Watering")

func _on_enter() -> void:
	pass


func _on_exit() -> void:
	pass
