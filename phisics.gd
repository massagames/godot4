#по умолчанию в редакторе для всех тел дейстует damping = 0.1 
#чтобы изменить его заходим в Project settings - General - Physics - 3D - Default linear damping = 0

func _physics_process(delta):
	apply_central_impulse(Vector3(0, 0, 1.0)) #импульс дает мгновенную linear_velocity = Vector3(0, 0, 1.0)
	
	add_force(Vector3(0, weight, 0), Vector3.UP) #постоянно действующая сила, в данном случае объект будет в невеосмости, 
  т.к его вес будет компенсироваться такой же сило направленной вверх
