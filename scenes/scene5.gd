extends Node

var dialogue = preload("res://assets/dialogue/scene5.dialogue")

func _ready() -> void:
	DialogueManager.show_dialogue_balloon(dialogue)

func end():
	pass
	#Transitioner.fade_to("res://scenes/scene6.tscn")
