@tool
@icon("res://addons/gk_editor_tools/icons/gk_spawn.svg")
class_name GKSpawn
extends Node3D

## Returns a JSON-compatible representation of this tree item and its children.
func to_json():
	return [position.x, position.y, position.z, rotation.y]

func _process(_delta):
	rotation.x = 0
	rotation.z = 0
	scale = Vector3.ONE
