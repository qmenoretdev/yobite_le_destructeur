///@param xOther
///@param yOther
///@param objectFollower
///@param rotation
///@param angle_ajustement
function scr_follow_point(argument0, argument1, argument2, argument3, argument4) {

	var xOther = argument0;
	var yOther = argument1;
	var objectFollower = argument2;
	var rotation = argument3;
	var angle = argument4;

	if (rotation == 0) {
		objectFollower.image_angle = point_direction(objectFollower.x,objectFollower.y,xOther,yOther);
		objectFollower.direction = objectFollower.image_angle;
	} else {
	
		var point_dir = point_direction(objectFollower.x,objectFollower.y,xOther,yOther) - angle;
		objectFollower.image_angle += (sin(degtorad(point_dir - objectFollower.image_angle)) * rotation);

	}

}

///@param xOther
///@param yOther
///@param objectFollower
///@param rotation
///@param angle_ajustement
///@param var_image_angle
function scr_follow_point_angle(xOther, yOther, objectFollower, rotation, angle,var_image_angle) {

	if (rotation == 0) {
		var point_dir = point_direction(objectFollower.x,objectFollower.y,xOther,yOther) - angle;
		return (sin(degtorad(point_dir - var_image_angle)));
	} else {
		var point_dir = point_direction(objectFollower.x,objectFollower.y,xOther,yOther) - angle;
		return (sin(degtorad(point_dir - var_image_angle)) * rotation);
	}

}

///@param imageAngle
///@param rotation
///@param angle_ajustement
///@param var_image_angle
function scr_follow_angle(imageAngle, rotation, angle,var_image_angle) {

	if (rotation == 0) {
		return (sin(degtorad(imageAngle - var_image_angle)));
	} else {
		var point_dir = imageAngle - angle;
		return (sin(degtorad(point_dir - var_image_angle)) * rotation);
	}

}

///@param var_image_angle
function scr_ajust_image_angle(var_image_angle) {
	while(var_image_angle > 360) {
		var_image_angle -= 360;
	}
	while(var_image_angle <= 0) {
		var_image_angle += 360;
	}
	return var_image_angle;
}