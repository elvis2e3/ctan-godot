extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _ocultar():
	var resource1 = get_node("/root/Init/MoreResource/resource1")
	var resource2 = get_node("/root/Init/MoreResource/resource2")
	var resource3 = get_node("/root/Init/MoreResource/resource3")
	var resource4 = get_node("/root/Init/MoreResource/resource4")
	var resource5 = get_node("/root/Init/MoreResource/resource5")
	resource1.set_visible(false)
	resource2.set_visible(false)
	resource3.set_visible(false)
	resource4.set_visible(false)
	resource5.set_visible(false)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if GlobalVar.player_city <= 0:
		var node1 = get_node("/root/Init/Ciudades/city1")
		GlobalVar.player_city_texture = node1.texture
		node1.texture = null
	if GlobalVar.player2_city <= 0:
		var node2 = get_node("/root/Init/Ciudades/city2")
		GlobalVar.player2_city_texture = node2.texture
		node2.texture = null
	var player1_place = get_node("/root/Init/Contadores/Player1/LabelPlace")
	var player1_path = get_node("/root/Init/Contadores/Player1/LabelPath")
	var player1_city = get_node("/root/Init/Contadores/Player1/LabelCity")
	player1_city.set_text(str(GlobalVar.player_city))
	player1_place.set_text(str(GlobalVar.player_place))
	player1_path.set_text(str(GlobalVar.player_path))
	var player2_place = get_node("/root/Init/Contadores/Player2/LabelPlace")
	var player2_path = get_node("/root/Init/Contadores/Player2/LabelPath")
	var player2_city = get_node("/root/Init/Contadores/Player2/LabelCity")
	player2_city.set_text(str(GlobalVar.player2_city))
	player2_place.set_text(str(GlobalVar.player2_place))
	player2_path.set_text(str(GlobalVar.player2_path))
	var player1_puntaje = get_node("/root/Init/Contadores/Player1/Puntaje")
	var player2_puntaje = get_node("/root/Init/Contadores/Player2/Puntaje")
	player1_puntaje.set_text(str(GlobalVar.player))
	player2_puntaje.set_text(str(GlobalVar.player2))
	var turn = GlobalVar.TURN
	if turn == GlobalVar.PLAYER_1:
		var lock = get_node("/root/Init/Modales/Player2") as Panel
		var show = get_node("/root/Init/Modales/Player1")
		lock.set_visible(true)
		show.set_visible(false)
	elif turn == GlobalVar.PLAYER_2:
		var lock = get_node("/root/Init/Modales/Player1")
		var show = get_node("/root/Init/Modales/Player2")
		lock.set_visible(true)
		show.set_visible(false)
	if GlobalVar.IS_RESOURSE and GlobalVar.QUANTITY_TURN > 4:
		var resources = get_node("/root/Init/MoreResource")
		resources.set_visible(true)
	else:
		var resources = get_node("/root/Init/MoreResource")
		resources.set_visible(false)
	var _resource = get_node("/root/Init/MoreResource/Resource")
	_resource.set_text(str(GlobalVar.RANDOM_RESOURCE))
	_ocultar()
	if GlobalVar.RANDOM_RESOURCE != null:
		var resource = get_node("/root/Init/MoreResource/resource" + str(GlobalVar.RANDOM_RESOURCE))
		resource.set_visible(true)
	var rplayer1 = GlobalVar.player_resouces
	var p1r1 = get_node("/root/Init/Contadores/Player1/LabelObeja")
	var p1r2 = get_node("/root/Init/Contadores/Player1/LabelLadrillo")
	var p1r3 = get_node("/root/Init/Contadores/Player1/LabelMadera")
	var p1r4 = get_node("/root/Init/Contadores/Player1/LabelMineral")
	var p1r5 = get_node("/root/Init/Contadores/Player1/LabelTrigo")
	p1r1.set_text(str(rplayer1["resource1"]))
	p1r2.set_text(str(rplayer1["resource2"]))
	p1r3.set_text(str(rplayer1["resource3"]))
	p1r4.set_text(str(rplayer1["resource4"]))
	p1r5.set_text(str(rplayer1["resource5"]))
	var rplayer2 = GlobalVar.player2_resouces
	var p2r1 = get_node("/root/Init/Contadores/Player2/LabelObeja")
	var p2r2 = get_node("/root/Init/Contadores/Player2/LabelLadrillo")
	var p2r3 = get_node("/root/Init/Contadores/Player2/LabelMadera")
	var p2r4 = get_node("/root/Init/Contadores/Player2/LabelMineral")
	var p2r5 = get_node("/root/Init/Contadores/Player2/LabelTrigo")
	p2r1.set_text(str(rplayer2["resource1"]))
	p2r2.set_text(str(rplayer2["resource2"]))
	p2r3.set_text(str(rplayer2["resource3"]))
	p2r4.set_text(str(rplayer2["resource4"]))
	p2r5.set_text(str(rplayer2["resource5"]))

func _on_button_player_1_pressed():
	#El ladron no sera parte del juego por eso (5), solo recogera recursos
	GlobalVar.RANDOM_RESOURCE = (randi() % 5) + 1
	GlobalVar.TURN = GlobalVar.PLAYER_2
	GlobalVar.QUANTITY_TURN += 1
	if GlobalVar.QUANTITY_TURN > 4:
		GlobalVar.IS_RESOURSE = true

func _on_button_player_2_pressed():
	GlobalVar.RANDOM_RESOURCE = (randi() % 5) + 1
	GlobalVar.TURN = GlobalVar.PLAYER_1
	GlobalVar.QUANTITY_TURN += 1
	if GlobalVar.QUANTITY_TURN > 4:
		GlobalVar.IS_RESOURSE = true


func _on_button_pressed():
	GlobalVar.IS_RESOURSE = false
	
