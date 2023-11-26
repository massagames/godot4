$Control/NewRecord/text_best_time.text = String(stepify(time_best, 0.01)) + " sec" # вывод числа с троку с точностью 0.01

@onready var tank = $t72 // godot 4
@onready var tankshadow = $t72_shadow
@onready var path:Path2D = $Path2D
@onready var dd:Node2D = $Node2D
@onready var text = $Control/RichTextLabel
@onready var Map001 = $Map001

onready var text_total_stars = $Control/stars_total # присваивание при загрузке скрипта godot 3.5
export (NodePath) onready var gbox = get_node(gbox) as CSGBox # ссылка на внешний объект определенного типа
export(int,1,1000) var numunits # переменная доступна из вне значения инт 1-1000

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

# позволяет вызвать функцию с именем указанныем 2 аргументом в виде строки и передать ей параметры
funcref(self,str(formation)+"Formation").call_func(unit_movable, get_global_mouse_position())

# получение угла 0-360 в зависисмости от направления вектора
func _input(event):
#	if event is InputEventMouseMotion:
#		pos = event.position #позиция курсора мыши
#		pos = pos - tank.position #из конца вычитаем начало получаем направление
#		var ang:float = pos.angle() #угол в радианах -3.14 до +3.14
#		ang = roundi((rad_to_deg(ang) + 180) / 5.625) #конвертируем в градусы, получаем -180..180 и прибавляем 180 чтобы получить 0..360
#		tank.frame = ang #поделив угол на  5.625 (360/64 кадра) находим текущий кадр анимации
	

# определяем попадает ли курсор мыши в баундбокс спрайта baseWhiteRing
func _input(event):
	if event is InputEventMouseMotion:
		onOver = baseWhiteRing.get_rect().has_point(baseWhiteRing.to_local(event.position))
		if onOver:
			baseSelect.visible = true
		else:
			baseSelect.visible = false
		#pos = event.position

# создание узла
func _ready():
    var sprite2d = Sprite2D.new() # Create a new Sprite2D.
    add_child(sprite2d) # Add it as a child of this node.

get_global_mouse_position() #

@export var items:Array[PackedScene] = [] #создаем массив в который модно помещать классы сцен в виде прелоад

func _physics_process(delta): #пример проверки на столкновения и реакции на них
	velocity = Vector2(-speed, 0)
	move_and_slide()
	var collisions:int = get_slide_collision_count()
	for i in collisions:
		var collide_info = get_slide_collision(i)
		var collider = collide_info.get_collider()
		if collider.has_method("take_damage"):
			collider.take_damage()
			queue_free()
			return

func _on_area_2d_body_entered(body): #пример реакции на вхождение тела в зону и проверки его группы и наличия метода
	if body.is_in_group("enemy"):
		if body.has_method("take_damage"):
			body.take_damage(35)
			print("collide")
			queue_free()
