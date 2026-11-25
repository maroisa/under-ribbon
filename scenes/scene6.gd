extends Node

@onready var next_scene = preload("res://scenes/main_menu.tscn")

var dialogue = preload("res://assets/dialogue/scene1.dialogue")

func _ready() -> void:
	DialogueManager.show_dialogue_balloon(dialogue)

func end():
	Transitioner.fade_to(next_scene)
