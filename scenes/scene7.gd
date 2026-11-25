extends Node

@onready var next_scene = preload("res://scenes/scene8.tscn")

var dialogue = preload("res://assets/dialogue/scene7.dialogue")

func _ready() -> void:
	DialogueManager.show_dialogue_balloon(dialogue)

func end():
	Transitioner.fade_to(next_scene)
