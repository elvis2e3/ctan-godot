extends TextureRect

func  _action_drag(type):
	pass

func _get_drag_data(at_position):
	var turn = str(GlobalVar.TURN)
	var preview_texture = TextureRect.new()
	preview_texture.texture = texture
	preview_texture.expand_mode = 1
	preview_texture.size = Vector2(30, 113)
	var preview = Control.new()
	preview.add_child(preview_texture)
	set_drag_preview(preview)
	#texture = null
	GlobalVar.ACTIVE = GlobalVar.PATH
	return preview_texture.texture

func _can_drop_data(at_position, data):
	return data is Texture2D

func _drop_data(at_position, data):
	texture = data
