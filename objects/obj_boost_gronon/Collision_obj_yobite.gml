if (other.inventory.boost.stock < other.inventory.boost.stock_max) {
	event_inherited();
	other.inventory.boost.stock++;
	instance_destroy(self);
}