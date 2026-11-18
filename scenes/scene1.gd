extends Node

var prologue_dialogue = preload("res://assets/dialogue/prologue.dialogue")



func _ready() -> void:
	DialogueManager.show_dialogue_balloon(prologue_dialogue)

	DialogueManager.dialogue_ended.connect(func(res: DialogueResource) -> void:
		Transitioner.fade_to("res://scenes/scene2.tscn"))
