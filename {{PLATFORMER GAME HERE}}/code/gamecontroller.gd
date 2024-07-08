extends Node2D

# Ensure that the node "Player" exists in the scene and is correctly named
@onready var player = get_parent().get_node("player")
# Called when the
var segments = [
	preload("res://scenes/block_1.tscn"),
	preload("res://scenes/block_2.tscn"),
	preload("res://scenes/block_3.tscn"),
	preload("res://scenes/block_4.tscn"),
]
var rng = RandomNumberGenerator.new()
@export var hight = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	spawn_block()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if player.position.y <= hight - 200:
		spawn_block()

func spawn_block():
	hight -= 100
	var number = rng.randi_range(1, 4)
	print(number)
	var block = segments[number - 1].instantiate()
	block.position = Vector2(600, hight)
	add_child(block)
		
