@tool
@icon("res://addons/gk_editor_tools/icons/gk_object.svg")
class_name GKObject
extends Node3D

## Approach behavior.
##
## STATIC: Do nothing.
## SHOOT: Stand and shoot at the katamari. (Functionally identical to STATIC)
## FLEE: Run from the katamari.
## CHARGE: Run towards the katamari.
## CLOWN: Jump on top of the katamari, then fall down after a few seconds.
enum ApproachBehavior {STATIC, SHOOT, FLEE, CHARGE, CLOWN}

## Physics behavior.
##
## STATIC: Stay still.
## GRAVITY: Falls as a physics object.
## PATH: Follows a path.
## ROAM: Roams an area.
## LAUNCH: If the parent object is bumped into, launches using the direction of a Vector3.
enum PhysicsBehavior {STATIC, GRAVITY, ROAM, PATH, LAUNCH}


@export var object_id:StringName = "debug_cube"
@export_group("Behavior")
@export_subgroup("Approach")
@export var approach_behavior:ApproachBehavior = ApproachBehavior.STATIC
@export var approach_speed:float = 1
@export var approaches_small_katamari:bool = false
@export_subgroup("Physics")
@export var physics_behavior:PhysicsBehavior = PhysicsBehavior.STATIC
@export_file("*.tres") var physics_file:String = ""
@export var physics_speed:float = 1
@export var launch_vector:Vector3 = Vector3.ZERO
@export_subgroup("Animation")
@export var animation:StringName = &""
@export var animation_speed:float = 1
@export_range(0, 1) var animation_phase:float = 0
@export var unload_size:float = -1

## Returns a JSON-compatible representation of this tree item and its children.
func to_json():
	var sub_objects_dict:Array = []
	for child in get_children():
		if child is GKObject:
			sub_objects_dict.push_back(child.to_json())
	var dict:Dictionary = {
		"id": object_id,
		"position": [position.x, position.y, position.z],
		"rotation": [rotation.x, rotation.y, rotation.z],
		"approach_behavior": int(approach_behavior),
		"approaches_small_katamari": approaches_small_katamari,
		"approach_speed": approach_speed,
		"physics_behavior": int(physics_behavior),
		"physics_file": physics_file,
		"physics_speed": physics_speed,
		"launch_vector": [launch_vector.x,launch_vector.y,launch_vector.z],
		"animation": String(animation),
		"animation_speed": animation_speed,
		"animation_phase": animation_phase,
		"sub_objects": sub_objects_dict,
		"unload_size": unload_size
	}
	
	return dict

