extends PanelContainer
@onready var tilling: Button = $MarginContainer/HBoxContainer/ToolTilling
@onready var Axe: Button = $MarginContainer/HBoxContainer/ToolAxe
@onready var watering: Button = $MarginContainer/HBoxContainer/Watering
@onready var plant: Button = $MarginContainer/HBoxContainer/Plant

func _on_tool_axe_pressed() -> void:
	ToolManager.select_tool(DataTypes.Tools.Axe)


func _on_tool_tilling_pressed() -> void:
	ToolManager.select_tool(DataTypes.Tools.Tillground)


func _on_watering_pressed() -> void:
	ToolManager.select_tool(DataTypes.Tools.Watering)


func _on_corn_pressed() -> void:
	ToolManager.select_tool(DataTypes.Tools.Corn)
	
func _on_tomato_pressed() -> void:
	ToolManager.select_tool(DataTypes.Tools.Tomato)
