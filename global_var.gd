extends Node

var key = "HAZME-REIR"
var limit_place = 5
var limit_city = 4
var limit_path = 12
var CITY = "city"
var PLACE = "place"
var PATH = "path"
var ACTIVE
var TURN = 1
var QUANTITY_TURN = 1
var IS_RESOURSE = false
var RANDOM_RESOURCE

var PLAYER_1 = 1
var player = "HA"
var player_city = 4
var player_place = 5
var player_path = 11
var player_city_texture
var player_place_texture
var player_path_texture
var player_city_list = []
var player_place_list = [] 
var player_path_list = []
var player_resouces = {
	"resource1": 0,
	"resource2": 0,
	"resource3": 0,
	"resource4": 0,
	"resource5": 0,
}
 
var PLAYER_2 = 2
var player2 = "HA"
var player2_city = 4
var player2_place = 5
var player2_path = 15
var player2_city_texture
var player2_place_texture
var player2_path_texture
var player2_city_list = []
var player2_place_list = [] 
var player2_path_list = []
var player2_resouces = {
	"resource1": 0,
	"resource2": 0,
	"resource3": 0,
	"resource4": 0,
	"resource5": 0,
} 

var mapa = [
	[1, 2, 3],
	[4, 5, 6, 7],
	[8, 9, 10, 11, 12],
	[13, 14, 15, 16],
	[17, 18, 19]
]

var map_city = {
	"1": [1,2,3,9,10,11],
	"2": [3,4,5,11,12,13],
	"3": [5,6,7,13,14,15],
	"4": [8,9,10,18,19,20],
	"5": [10,11,12,20,21,22],
	"6": [12,13,14,22,23,24],
	"7": [14,15,16,24,25,26],
	"8": [17,18,19,28,29,30],
	"9": [19,20,21,30,31,32],
	"10": [21,22,23,32,33,34],
	"11": [23,24,25,34,35,36],
	"12": [25,26,27,36,37,38],
	"13": [29,30,31,39,40,41],
	"14": [31,32,33,41,42,43],
	"15": [33,34,35,43,44,45],
	"16": [35,36,37,45,46,47],
	"17": [40,41,42,48,49,50],
	"18": [42,43,44,50,51,52],
	"19": [44,45,46,52,53,54],
}

var map_resource = {
	"1": 4,
	"2": 1,
	"3": 3,
	"4": 5,
	"5": 2,
	"6": 1,
	"7": 2,
	"8": 5,
	"9": 3,
	"10": 0,
	"11": 3,
	"12": 4,
	"13": 3,
	"14": 4,
	"15": 5,
	"16": 1,
	"17": 2,
	"18": 5,
	"19": 1,
}

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
