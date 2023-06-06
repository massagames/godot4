$Control/NewRecord/text_best_time.text = String(stepify(time_best, 0.01)) + " sec" - вывод числа с троку с точностью 0.01

onready var text_total_stars = $Control/stars_total - присваивание при загрузке скрипта

enum State {IDLE, RUN, AWAY} - перечисление
var state = State.IDLE - задаем значение переменной
change_state(State.RUN) - можно подавать в функцию

Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE) - делать курсор мыши видимым

var starSrc = preload("res://sfxs/sfx_plane_crash.tscn") - прелоад необходим для всех партикл эффектов
var star = starSrc.instance()
	add_child(star)
	star.position = Vector2 (rand_range(200, 1050), rand_range(300, 2350))
    
