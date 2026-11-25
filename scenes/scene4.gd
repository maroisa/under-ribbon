extends Node

@onready var next_scene = preload("res://scenes/scene5.tscn")

var dialogue = preload("res://assets/dialogue/scene4.dialogue")

func _ready() -> void:
	DialogueManager.show_dialogue_balloon(dialogue)

func end(choice: int):
	GameManager.hobby_choice = choice
	Transitioner.fade_to(next_scene)
