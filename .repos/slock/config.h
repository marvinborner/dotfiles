/* user and group to drop privileges to */
static const char *user  = "melvin";
static const char *group = "melvin";

static const char *colorname[NUMCOLS] = {
	[BACKGROUND] = "black",     /* after initialization */
	[INIT] =       "#2d2d2d",   /* after initialization */
	[INPUT] =      "#2d2d2d",   /* during input */
	[FAILED] =     "#cc3333",   /* wrong password */
	[PAM] =        "#9400D3",   /* waiting for PAM */
};

/* treat a cleared input like a wrong password (color) */
static const int failonclear = 1;

/* PAM service that's used for authentication */
static const char* pam_service = "login";

/* insert grid pattern with scale 1:1, the size can be changed with logosize */
static const int logosize = 75;
static const int logow = 10;	/* grid width and height for right center alignment*/
static const int logoh = 5;

static XRectangle rectangles[11] = {
	/* x	y	w	h */
	{  0,	0,	1,	5 },
	{  1,	1,	1,	1 },
	{  2,	2,	1,	1 },
	{  3,	1,	1,	1 },
	{  4,	0,	1,	5 },

	{  6,	0,	1,	5 },
	{  7,	0,	2,	1 },
	{  7,	2,	2,	1 },
	{  7,	4,	2,	1 },
	{  9,	1,	1,	1 },
	{  9,	3,	1,	1 },

};

/* time in seconds before the monitor shuts down */
static const int monitortime = 10;
