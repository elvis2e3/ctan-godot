extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var node1 = get_node("/root/Init/Ciudades/city1")
	GlobalVar.player_city_texture = node1.texture
	node1.texture = null
	var node2 = get_node("/root/Init/Ciudades/city2")
	GlobalVar.player2_city_texture = node2.texture
	node2.texture = null


func _on_button_player_1_pressed():
	GlobalVar.TURN = GlobalVar.PLAYER_2


func _on_button_player_2_pressed():
	GlobalVar.TURN = GlobalVar.PLAYER_1
