function init_variables()
    screen_size = 128
	sprite_size = 8
	collision_size = 6

	player = {}
	player.x = 20
	player.y = 20
	player.alive = true
	player.sprite = 1
    player.width = 8;
    player.height = 8;	
	
	enemy = {}
	enemy.x = 80
	enemy.y = 80
	enemy.sprite = 16
	
	give_oxigen = false
	dead = false
	
	color_background = 1
	rectfill(1,1,127,127, 5)
	color = 5
    directions = { up = 2, down = 3, left = 0, right = 1}

    tmpx = player.x
    tmpy = player.y
end

function draw_flower()
    spr(43, 1, 1    )
end

function load_map()
    map(0,0,0,0,127,127)
end

function get_sprite_in_position (x, y)
    return mget(x,y)
end

function is_empty_sprite(sprite)
    empty = true
    if sprite != 0 then
        empty = false
    end
    return empty
end

function is_empty_pixel(x,y) 
    empty = is_empty_sprite(get_sprite_in_position(x,y))
    return empty
end

function is_not_empty_pixel(x, y)
    return not is_empty_pixel(x,y)
end

function can_move_sprite(direction, x, y, spr_size)
    can_move = true
    tmpx = x
    tmpy = y
    if (direction == directions.up) then
        if (is_not_empty_pixel(x,y-1) and is_not_empty_pixel(x+spr_size, y-1)) then
            can_move = false
        end        
    elseif (direction == directions.down) then
        if (is_not_empty_pixel(x,y+1) and is_not_empty_pixel(x+spr_size, y+1)) then
            can_move = false
        end        
    elseif (direction == directions.left) then
        if (is_not_empty_pixel(x-1,y) and is_not_empty_pixel(x-1, y+spr_size)) then
            can_move = false
        end        
    elseif (direction == directions.right) then
        if (is_not_empty_pixel(x+1,y) and is_not_empty_pixel(x+1, y+spr_size)) then
            can_move = false
        end        
    end

    return can_move
end

