if (other.destructible && !other.invinc && player_side != other.player_side) {
	destroy = true;
	scr_degat(self, other);
}