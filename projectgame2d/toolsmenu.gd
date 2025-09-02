extends PanelContainer

@onready var shovel: Button = $MarginContainer/HBoxContainer/Shovel
@onready var axe: Button = $MarginContainer/HBoxContainer/Axe
@onready var watering: Button = $MarginContainer/HBoxContainer/Watering
@onready var plant: Button = $MarginContainer/HBoxContainer/Plant

func _on_shovel_pressed() -> void:
	ToolManager.selected(DataTypes.Tools.Shovel)
	
func _on_axe_pressed() -> void:
	ToolManager.selected(DataTypes.Tools.Axe)
	
func _on_watering_pressed() -> void:
	ToolManager.selected(DataTypes.Tools.Watering)
	
func _on_plant_pressed() -> void:
	ToolManager.selected(DataTypes.Tools.Plant)

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("release_tool"):
		ToolManager.select_tool(DataTypes.Tools.None)
		axe.release_fobus()
		shovel.release_fobus()
		watering.release_fobus()
		plant.release_fobus()
