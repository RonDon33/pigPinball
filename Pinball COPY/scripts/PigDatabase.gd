extends Resource

class_name pigList

@export var pigs : Array[pigData]

func getPigs():
	return pigs

func sort_by_id(a , b):
	if a.pigID < b.pigID:
		return true
	return false
