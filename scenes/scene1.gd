extends Node

var dialogue = preload("res://assets/dialogue/scene1.dialogue")

func _ready() -> void:
	DialogueManager.show_dialogue_balloon(dialogue)

func end():
	Transitioner.fade_to("res://scenes/scene2.tscn")
