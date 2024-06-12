if (other.inventory.regen.stock < other.inventory.regen.stock_max) {
	event_inherited();
	other.inventory.regen.stock++;
	instance_destroy(self);
}