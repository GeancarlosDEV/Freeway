extends Area2D

export var speed = 100
var screen_size
signal pontua


func _ready():
	screen_size = get_viewport_rect().size


func _process(delta):
	var velocity = Vector2()
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1
		
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$AnimatedSprite.play()
	else:
		$AnimatedSprite.stop()
		
	position += velocity * delta
	#Não sair da tela
	position.y = clamp(position.y,0,screen_size.y)
	
	#Tocas animações certas
	if velocity.y > 0 :
		$AnimatedSprite.animation = "baixo"
	elif velocity.y < 0:
		$AnimatedSprite.animation = "cima"


func _on_Player_body_entered(body):
	if body.name == "Ganha":
		emit_signal("pontua")
	else:
		$AudioStreamPlayer2D.play()
	position.x = 320
	position.y = 696
	
	
func volta():
	position.x = 320
	position.y = 696
