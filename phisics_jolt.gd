# функции jolt и их работа

func _ready():
	constant_force = Vector3(0, mass * 9.8, 0) # постоянная сила противодействующая гравитации


apply_central_impulse(Vector3(0, 1, 0)) # импульс равный 1 направленный вверх, создаст линейную скорость ввех 1, если масса тела = 5, то скорость будет равана 0.2
apply_central_force(Vector3(0, mass * 60, 0)) # сила расятнута во времени, расчитывается с учетом физ кадров, mass * 60 даст эффект импульса

apply_torque_impulse(Vector3(0, 1, 0)) # импульс вращения вдоль вертикальной оси Y скорость вращения равна 0.503497 рад или 28.8482 град. При массе тела 5, скорость вращения будет ниже в 5 раз
