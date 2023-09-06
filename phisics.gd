#по умолчанию в редакторе для всех тел дейстует damping = 0.1 
#чтобы изменить его заходим в Project settings - General - Physics - 3D - Default linear damping = 0

#friction влияет только на трение между другими ригидбоди телами, на движение в воздухе не влияет

#вращение идет в диапазоне от -3.14 до 3.14 радиан или -180 до 180 град

func _ready():
	constant_force = Vector3(0, mass * 9.8, 0) - постоянная сила противодействия гравитации, тело зависнет на месте

func _physics_process(delta):
	apply_central_impulse(Vector3(0, 0, 1.0)) #импульс телу c mass = 1 или weight = 9.8 дает мгновенную linear_velocity = Vector3(0, 0, 1.0) если масса тела 5кг, то линейная скорость после импульса будет 0.2
	
	add_force(Vector3(0, weight, 0), Vector3.UP) #постоянно действующая сила, в данном случае объект будет в невеосмости, 
	#т.к его вес будет компенсироваться такой же силой направленной вверх
	
	apply_torque_impulse(Vector3(0, 0, 1.0)) #импульс вращения по оси z придаст angular_velocity равное 0.400315 радиана (22.93632 град) в сек, проходит 3.14 примерно за 7.87 сек

	
