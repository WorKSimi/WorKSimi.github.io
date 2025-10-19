extends Node

@onready var multiplayer_ui = $UI/Multiplayer
@onready var line_edit: LineEdit = $UI/Multiplayer/VBoxContainer/Name

const PLAYER = preload("res://player.tscn")

const PORT = 25565
const ADDRESS = "73.199.103.78"

var peer = ENetMultiplayerPeer.new()

func _on_host_pressed():
	peer.create_server(PORT)
	multiplayer.multiplayer_peer = peer
	
	multiplayer.peer_connected.connect(
		func(pid):
			print("Peer " + str(pid) + " has joined the game!")
			add_player(pid)
	)
	add_player(multiplayer.get_unique_id())
	multiplayer_ui.hide()

func _on_join_pressed() -> void:
	peer.create_client(ADDRESS, PORT)
	multiplayer.multiplayer_peer = peer
	multiplayer_ui.hide()

func add_player(pid):
	var player = PLAYER.instantiate()
	player.name = str(pid)
	add_child(player)
