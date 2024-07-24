@tool
@icon("res://addons/gk_editor_tools/icons/gk_static.svg")
class_name GKStatic
extends Node3D

@export_file("*.tscn") var path:String = ""

## Returns a JSON-compatible representation of this tree item and its children.
func to_json():
	return [path]

func _process(_delta):
	transform = Transform3D.IDENTITY
