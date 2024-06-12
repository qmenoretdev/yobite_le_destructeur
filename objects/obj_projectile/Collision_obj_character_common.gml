if (player_side != other.player_side && !other.invinc) {
	destroy = true;
	scr_degat(self, other);
}