tool
extends EditorPlugin

func _enter_tree() -> void:
	pass

func _exit_tree() -> void:
	pass

# Handle input in a simple way
func _input(event: InputEvent) -> void:
	if(event is InputEventKey):
		if(event.pressed):
			match(event.scancode):
				KEY_1:
					change_render_priority("decrement")
				KEY_2:
					change_render_priority("increment")

# Function which increments or decrements render priority of specific node types
func change_render_priority(render_priority: String) -> void:
	for selected_node in get_editor_interface().get_selection().get_selected_nodes():
		if((selected_node is Label3D) or (selected_node is Sprite3D) or (selected_node is AnimatedSprite3D)):
			match(render_priority):
				"increment":
					selected_node.set_render_priority(selected_node.get_render_priority() + 1)
				"decrement":
					selected_node.set_render_priority(selected_node.get_render_priority() - 1)
		else:
			print("Can't set render priority to ", selected_node)
