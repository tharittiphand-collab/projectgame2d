extends CanvasLayer

@export var game_scene: PackedScene
func _on_start_pressed() -> void:
	if game_scene:
		var scene_instance = game_scene.instantiate()
		get_tree().root.add_child(scene_instance)
		get_tree().current_scene.queue_free()
	else:
		push_error("⚠️ Game scene ยังไม่ได้ assign ใน Inspector")


func _on_exit_pressed() -> void:
	get_tree().quit()
