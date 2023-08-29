/* user and group to drop privileges to */
static const char *user  = "melvin";
static const char *group = "melvin";

static const char *colorname[NUMCOLS] = {
	[BACKGROUND] = "black",   /* after initialization */
	[INIT] =       "black",   /* after initialization */
	[INPUT] =      "black",   /* during input */
	[FAILED] =     "red",     /* wrong password */
	[PAM] =        "green",   /* waiting for PAM */
};

/* treat a cleared input like a wrong password (color) */
static const int failonclear = 1;

/* PAM service that's used for authentication */
static const char* pam_service = "login";

/* insert grid pattern with scale 1:1, the size can be changed with logosize */
static const int logosize = 50;
static const int logow = 2;	/* grid width and height for right center alignment*/
static const int logoh = 2;

static XRectangle rectangles[4] = {
	/* x	y	w	h */
	{  0,	0,	1,	1 },
	{  0,	1,	1,	1 },
	{  1,	0,	1,	1 },
	{  1,	1,	1,	1 },
};

/* time in seconds before the monitor shuts down */
static const int monitortime = 10;
