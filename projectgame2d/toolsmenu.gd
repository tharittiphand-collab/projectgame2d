extends PanelContainer

@onready var shovel: Button = $MarginContainer/HBoxContainer/Shovel
@onready var axe: Button = $MarginContainer/HBoxContainer/Axe
@onready var watering: Button = $MarginContainer/HBoxContainer/Watering
@onready var plant: Button = $MarginContainer/HBoxContainer/Plant

func _on_shovel_pressed() -> void:
	ToolManager.selected(DataTypes.Tools.Shovel)
