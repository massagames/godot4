# этот файл мы используем как синглтон и указываем это в ProjectSettings - AutoLoad - 
# указываем путь к фалу, даем краткое имя G и жмем Add
extends Node

var current_scene_name = null

func goToScene(scene_name):
	get_tree().change_scene("res://scenes/" + scene_name + ".tscn")
	current_scene_name = scene_name
	
func _physics_process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().quit()
	
	
func _ready():
	OS.center_window()
	#goToScene("")
