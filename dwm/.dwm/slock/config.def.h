/* user and group to drop privileges to */
static const char *user  = "nobody";
static const char *group = "nogroup"; // use "nobody" for arch

static const char *colorname[NUMCOLS] = {
	[INIT] =   "black",     /* after initialization */
	[INPUT] =  "#005577",   /* during input */
	[FAILED] = "#CC3333",   /* wrong password */
};




/*
 * Xresources preferences to load at startup
 */
ResourcePref resources[] = {
		{ "locked",       STRING,  &colorname[INIT] },
		{ "input",        STRING,  &colorname[INPUT] },
		{ "failed",       STRING,  &colorname[FAILED] },
};

/* lock screen opacity */
static const float alpha = 0.9;

/* treat a cleared input like a wrong password (color) */
static const int failonclear = 1;









