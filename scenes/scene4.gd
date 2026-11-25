extends Node

@onready var next_scene = preload("res://scenes/scene5.tscn")

var dialogue = preload("res://assets/dialogue/scene4.dialogue")

func _ready() -> void:
	DialogueManager.show_dialogue_balloon(dialogue)

func end(choice: int):
	if choice == 0:
		print("SKIP!")
		GameManager.hobby_choice = 0
		Transitioner.fade_to(next_scene)
	
	GameManager.hobby_choice = choice - 1
	
	Transitioner.fade_to(next_scene)
