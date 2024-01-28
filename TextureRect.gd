extends TextureRect

func  _action_drag(type):
	var turn = str(GlobalVar.TURN)
	var preview_texture = TextureRect.new()
	preview_texture.texture = texture
	preview_texture.expand_mode = 1
	preview_texture.size = Vector2(30, 30)
	var preview = Control.new()
	preview.add_child(preview_texture)
	set_drag_preview(preview)
	var quantity_type = 0
	if type==GlobalVar.CITY + turn:
		GlobalVar.ACTIVE = GlobalVar.CITY
	elif type==GlobalVar.PLACE + turn:
		GlobalVar.ACTIVE = GlobalVar.PLACE
	return preview_texture.texture

func _get_drag_data(at_position):
	var turn = str(GlobalVar.TURN)  
	if name==GlobalVar.CITY + turn:
		return _action_drag(GlobalVar.CITY + turn)
	elif name==GlobalVar.PLACE + turn:
		return _action_drag(GlobalVar.PLACE + turn)

func _can_drop_data(at_position, data):
	return data is Texture2D

func _drop_data(at_position, data):
	var node
	var quantity_type = 0
	var turn = str(GlobalVar.TURN)
	if GlobalVar.ACTIVE == GlobalVar.CITY:
		node = get_node("/root/Init/Ciudades/city" + turn)
		if GlobalVar.TURN == GlobalVar.PLAYER_1:
			GlobalVar.player_city -= 1
			quantity_type = GlobalVar.player_city
			GlobalVar.player_city_texture = data
			GlobalVar.player_city_list.append(name.to_int())
		elif GlobalVar.TURN == GlobalVar.PLAYER_2:
			GlobalVar.player2_city -= 1
			quantity_type = GlobalVar.player2_city
			GlobalVar.player2_city_texture = data
			GlobalVar.player2_city_list.append(name.to_int())
	elif GlobalVar.ACTIVE == GlobalVar.PLACE:
		node = get_node("/root/Init/Ciudades/place" + turn)
		if GlobalVar.TURN == GlobalVar.PLAYER_1:
			GlobalVar.player_place -= 1
			quantity_type = GlobalVar.player_place
			GlobalVar.player_place_texture = data
			GlobalVar.player_place_list.append(name.to_int())
		elif GlobalVar.TURN == GlobalVar.PLAYER_2:
			GlobalVar.player2_place -= 1
			quantity_type = GlobalVar.player2_place
			GlobalVar.player2_place_texture = data
			GlobalVar.player2_place_list.append(name.to_int())
	else:
		return null
	if quantity_type <= 0:
		node.texture =  null
	texture = data
	#position.x -= 20
	#position.y -= 20
	#var panel = get_child(0)
	#panel.position.x += 20
	#panel.position.y += 20
