$Control/NewRecord/text_best_time.text = String(stepify(time_best, 0.01)) + " sec" # вывод числа с троку с точностью 0.01

onready var text_total_stars = $Control/stars_total # присваивание при загрузке скрипта
export (NodePath) onready var gbox = get_node(gbox) as CSGBox # ссылка на внешний объект определенного типа

enum State {IDLE, RUN, AWAY} # перечисление
var state = State.IDLE # задаем значение переменной
change_state(State.RUN) # можно подавать в функцию

Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE) # делать курсор мыши видимым

var starSrc = preload("res://sfxs/sfx_plane_crash.tscn") # прелоад необходим для всех партикл эффектов
var star = starSrc.instance()
	add_child(star)
	star.position = Vector2 (rand_range(200, 1050), rand_range(300, 2350))
    
# пример использования await для запуска анимаций и функций по порядку, 3 анимации, затем таймер 0.5 сек и по завершению самоуничтожение
@onready var ap = $AnimationPlayer
# Called when the node enters the scene tree for the first time.
func _ready():
	run_animations()
	pass # Replace with function body.

func run_animations():
	ap.play("Move_X")
	await ap.animation_finished
	ap.play("Move_Y")
	await ap.animation_finished
	ap.play("Move_Z")
	await ap.animation_finished
	await get_tree().create_timer(0.5).timeout
	queue_free()
	print("finish")

