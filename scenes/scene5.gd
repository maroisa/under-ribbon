extends Node

@onready var next_scene = preload("res://scenes/scene6.tscn")

const choice_text = [
	"Kamu menceritakan bahwa kamu suka bermain video game di rumah untuk mengisi waktu luang.",
	"Kamu menjawab bahwa kamu sering mendengarkan musik di rumah saat santai.",
	"Kamu menyebutkan bahwa di waktu luang kamu cukup sering membaca buku di rumah.",
	"Kamu menceritakan bahwa kamu tertarik pada dunia penulisan dan terkadang mencoba menulis cerita sendiri di waktu luang.",
]

const choice_text2 = [
	"Pertanyaan itu dilontarkannya dengan nada ramah namun tetap menjaga kesopanan sebagai teman sebangku yang baru dikenal.",
	"Kamu menyebutkan genre atau musisi yang biasa kamu dengarkan, dan Alya menyimak dengan sopan sembari menikmati makanannya.",
	"Kalian bertukar beberapa judul secara singkat, menemukan titik temu obrolan yang menyenangkan tanpa terasa memaksakan kedekatan.",
	"Ia mengapresiasi hobimu dengan nada jujur dan santun, menghargai bakat teman barunya."
]

var dialogue = preload("res://assets/dialogue/scene5.dialogue")

func _ready() -> void:
	DialogueManager.show_dialogue_balloon(dialogue)

func end():
	Transitioner.fade_to(next_scene)


func play_text() -> void:
	$Label.text = ""
	$Label.visible_characters = 0
	
	var text_length = 0
	
	$Label.visible_characters = 0
	$Label.text = choice_text[GameManager.hobby_choice]
	text_length = choice_text[GameManager.hobby_choice].length()
	while $Label.visible_characters < text_length:
		$Label.visible_characters += 1
		await get_tree().create_timer(0.01).timeout
	
	await get_tree().create_timer(1).timeout
	$Label.text = ""
	$Label.visible_characters = 0

func play_text2() -> void:
	$Label.text = ""
	$Label.visible_characters = 0
	
	var text_length = 0
	
	$Label.visible_characters = 0
	$Label.text = choice_text2[GameManager.hobby_choice]
	text_length = choice_text2[GameManager.hobby_choice].length()
	while $Label.visible_characters < text_length:
		$Label.visible_characters += 1
		await get_tree().create_timer(0.01).timeout
	
	await get_tree().create_timer(1).timeout
