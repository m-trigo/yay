extends Node2D

var speed = 256;
var direction = Vector2(1, 1)


func _ready():
	randomize();
	var angle = rand_range(0, PI * 2);
	direction.x = cos(angle);
	direction.y = sin(angle);
	
func _process(delta):

	$Sphere.position.x += direction.x * speed * delta;
	$Sphere.position.y += direction.y * speed * delta;
	
	if Input.is_action_pressed("potato"):
		get_tree().quit();
	if Input.is_key_pressed(KEY_R):
# warning-ignore:return_value_discarded
		get_tree().reload_current_scene();

func _on_Area_area_entered(area):
	if area.name == "Right" or area.name == "Left":
		direction.x *= -1;
	else:
		direction.y *= -1;
	speed += 64;
	$Sphere/Player.play();

func _on_YayArea_area_entered(area):
	$YayPlayer.play();
