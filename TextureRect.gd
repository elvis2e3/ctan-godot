extends TextureRect

func  _action_drag(type):
	var preview_texture = TextureRect.new()
	preview_texture.texture = texture
	preview_texture.expand_mode = 1
	preview_texture.size = Vector2(30, 30)
	var preview = Control.new()
	preview.add_child(preview_texture)
	set_drag_preview(preview)
	var quantity_type = 0
	if type==GlobalVar.CITY:
		GlobalVar.ACTIVE = GlobalVar.CITY
	elif type==GlobalVar.PLACE:
		GlobalVar.ACTIVE = GlobalVar.PLACE
	return preview_texture.texture

func _get_drag_data(at_position):
	if name==GlobalVar.CITY:
		return _action_drag(GlobalVar.CITY)
	elif name==GlobalVar.PLACE:
		return _action_drag(GlobalVar.PLACE)

func _can_drop_data(at_position, data):
	return data is Texture2D

func _drop_data(at_position, data):
	var node
	var quantity_type = 0
	if GlobalVar.ACTIVE == GlobalVar.CITY:
		node = get_node("/root/Init/Ciudades/city")
		GlobalVar.player_city -= 1
		quantity_type = GlobalVar.player_city
	elif GlobalVar.ACTIVE == GlobalVar.PLACE:
		node = get_node("/root/Init/Ciudades/place")
		GlobalVar.player_place -= 1
		quantity_type = GlobalVar.player_place
	if quantity_type == 0:
		node.texture =  null
	texture = data
