extends CharacterBody2D

var speed = 100
var sprint = 200
var carry_speed = 70   # เวลาถือของ เดินช้าลง

var player_state = "idle"
var last_direction := Vector2.RIGHT

func _physics_process(delta):
	var direction = Input.get_vector("left","right","up","down")

	# ======================
	# เช็ค Action พิเศษก่อน
	# ======================
	if Input.is_action_just_pressed("carrying"):
		player_state = "carrying"
	elif Input.is_action_just_pressed("watering"):
		player_state = "watering"
	elif Input.is_action_just_pressed("shovel"):
		player_state = "tilling"
	elif Input.is_action_just_pressed("axe"):
		player_state = "chopping"
	else:
		# ถ้าไม่มีการใช้เครื่องมือ → เดิน/วิ่งปกติ
		if direction == Vector2.ZERO:
			player_state = "idle"
		else:
			if Input.is_action_pressed("running"):
				player_state = "sprinting"
			else:
				# ถ้าแบกของอยู่ เดินช้าลง
				if player_state == "carrying":
					player_state = "carrying"
				else:
					player_state = "walking"

	# ======================
	# กำหนดความเร็ว
	# ======================
	match player_state:
		"idle":
			velocity = Vector2.ZERO
		"walking":
			velocity = direction * speed
		"sprinting":
			velocity = direction * sprint
		"carrying":
			velocity = direction * carry_speed
		"watering", "shovel", "axe":
			velocity = Vector2.ZERO  # หยุดขณะทำ action

	# เก็บทิศสุดท้าย
	if direction != Vector2.ZERO:
		last_direction = direction

	move_and_slide()
	play_anim(direction)


func play_anim(dir: Vector2):
	var sprite = $AnimatedSprite2D

	# ใช้ทิศล่าสุดตอน idle/action
	var check_dir = dir
	if check_dir == Vector2.ZERO:
		check_dir = last_direction

	# flip ซ้าย/ขวา
	if check_dir.x < 0:
		sprite.flip_h = true
	elif check_dir.x > 0:
		sprite.flip_h = false

	# เล่น animation ตาม state
	match player_state:
		"idle":
			sprite.play("idle")
		"walking":
			sprite.play("walking")
		"sprinting":
			sprite.play("running")
		"carrying":
			if dir == Vector2.ZERO:
				sprite.play("carry_idle")
			else:
				sprite.play("carry_walk")
		"watering":
			sprite.play("watering")
		"shovel":
			sprite.play("shovel")
		"chopping":
			sprite.play("axe")
