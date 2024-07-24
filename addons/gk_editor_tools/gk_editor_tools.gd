@tool
class_name GKEditorToolsPlugin
extends EditorPlugin

## The ID of the "Export as GK Level" menu item.
const EXPORT_ENTRY_ID:int = 31804

func _enter_tree():
	# Initialization of the plugin goes here.
	get_export_as_menu().add_item("Galactic Katamari Level...", EXPORT_ENTRY_ID)
	get_export_as_menu().set_item_metadata(get_export_as_menu().get_item_index(EXPORT_ENTRY_ID), _export_gkl)


func _exit_tree():
	# Clean-up of the plugin goes here.
	get_export_as_menu().remove_item(get_export_as_menu().get_item_index(EXPORT_ENTRY_ID))


func _export_gkl():
	print("GKL export pressed")
