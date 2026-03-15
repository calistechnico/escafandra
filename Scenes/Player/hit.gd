extends Base
class_name Hit

func Enter():
	print_debug("hit entered")
	health -= 20
	health_bar.value = health
	

func Update(_delta):
	super(_delta)
	
