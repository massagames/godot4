#по умолчанию в редакторе для всех тел дейстует damping = 0.1 
#чтобы изменить его заходим в Project settings - General - Physics - 3D - Default linear damping = 0

#friction влияет только на трение между другими ригидбоди телами, на движение в воздухе не влияет

func _physics_process(delta):
	apply_central_impulse(Vector3(0, 0, 1.0)) #импульс телу c mass = 1 или weight = 9.8 дает мгновенную linear_velocity = Vector3(0, 0, 1.0)
	
	add_force(Vector3(0, weight, 0), Vector3.UP) #постоянно действующая сила, в данном случае объект будет в невеосмости, 
	#т.к его вес будет компенсироваться такой же силой направленной вверх
