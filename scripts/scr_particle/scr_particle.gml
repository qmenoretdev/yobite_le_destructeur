///@param sprParticle
///@param minSize
///@param maxSize
///@param minAngle
///@param maxAngle
///@param minLife
///@param maxLife
function scr_particle_hit(argument0, argument1, argument2, argument3, argument4, argument5, argument6) {

	var sprParticle=argument0;
	var minSize=argument1;
	var maxSize=argument2;
	var minAngle=argument3;
	var maxAngle=argument4;
	var minLife=argument5;
	var maxLife=argument6;
	var particleType_Hit;

	particleType_Hit = part_type_create();
	part_type_sprite(particleType_Hit,sprParticle,0,0,0);
	part_type_size(particleType_Hit,minSize,maxSize,0.05,0);
	part_type_life(particleType_Hit,minLife,maxLife);
	part_type_alpha3(particleType_Hit,1,0.6,0.2);
	part_type_orientation(particleType_Hit,minAngle,maxAngle,0,0,1);

	return particleType_Hit;
}

///@param sprParticle
///@param minSize
///@param maxSize
///@param minLife
///@param maxLife
///@param minDirection
///@param maxDirection
///@param minSpeed
///@param maxSpeed
function scr_particle_spark(sprParticle, minSize, maxSize, minLife, maxLife, minDirection, maxDirection, minSpeed, maxSpeed) {

	var particleType_Spark

	particleType_Spark = part_type_create();
	part_type_sprite(particleType_Spark,sprParticle,0,0,0);
	part_type_size(particleType_Spark,minSize,maxSize,-0.01,0);
	part_type_life(particleType_Spark,minLife,maxLife);
	part_type_alpha3(particleType_Spark,1,0.8,0.1);
	part_type_orientation(particleType_Spark,0,359,0,0,1);
	part_type_speed(particleType_Spark,minSpeed,maxSpeed,-0.1,0);
	part_type_direction(particleType_Spark,minDirection,maxDirection,0,0);

	return particleType_Spark
}