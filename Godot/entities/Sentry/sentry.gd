extends Node2D

@export var player:CharacterBody2D

@onready var top_half = $SpriteTopHalf

func _process(_delta):
	scale.x = int(player.global_position.x > global_position.x) * 2 - 1

	top_half.look_at(player.global_position)
	top_half.rotation = clamp(top_half.rotation, -PI/2, PI/4)
