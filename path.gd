extends TextureRect

func  _action_drag(type):
	pass

func _get_drag_data(at_position):
	var turn = str(GlobalVar.TURN)
	if GlobalVar.PATH + turn == name:
		var preview_texture = TextureRect.new()
		preview_texture.texture = texture
		preview_texture.expand_mode = 1
		preview_texture.size = Vector2(30, 113)
		var preview = Control.new()
		preview.add_child(preview_texture)
		set_drag_preview(preview)
		GlobalVar.ACTIVE = GlobalVar.PATH
		return preview_texture.texture

func _can_drop_data(at_position, data):
	return data is Texture2D

func _drop_data(at_position, data):
	var turn = str(GlobalVar.TURN)
	var node
	var quantity_path = 0
	if GlobalVar.ACTIVE == GlobalVar.PATH:
		node = get_node("/root/Init/Caminos/path" + turn)
		if GlobalVar.TURN == GlobalVar.PLAYER_1:
			GlobalVar.player_path -= 1
			quantity_path = GlobalVar.player_path
			GlobalVar.player_path_texture = data
			GlobalVar.player_path_list.append(name.to_int())
		elif GlobalVar.TURN == GlobalVar.PLAYER_2:
			GlobalVar.player2_path -= 1
			quantity_path = GlobalVar.player2_path
			GlobalVar.player2_path_texture = data
			GlobalVar.player2_path_list.append(name.to_int())
		if quantity_path <= 0:
			node.texture =  null
		texture = data
