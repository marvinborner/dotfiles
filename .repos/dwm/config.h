/* See LICENSE file for copyright and licene details. */

/* appearance */
static const unsigned int borderpx  = 1;        /* border pixel of windows */
static const unsigned int snap      = 32;       /* snap pixel */
static const int showbar            = 1;        /* 0 means no bar */
static const int topbar             = 1;        /* 0 means bottom bar */
static const char *fonts[]          = { "Iosevka Term:pixelsize=14:antialias=true:autohint=true" };
static const char dmenufont[]       = "Iosevka Term:pixelsize=14:antialias=true:autohint=true";
static const char col_gray1[]       = "#222222";
static const char col_gray2[]       = "#444444";
static const char col_gray3[]       = "#bbbbbb";
static const char col_gray4[]       = "#eeeeee";
static const char col_cyan[]        = "#005577";
static const char *colors[][3]      = {
	/*               fg         bg         border   */
	[SchemeNorm] = { col_gray3, col_gray1, col_gray2 },
	[SchemeSel]  = { col_gray4, col_cyan,  col_cyan  },
};

typedef struct {
	const char *name;
	const void *cmd;
} Sp;
const char *spcmd0[] = {"term", "-t", "spterm1", NULL };
const char *spcmd1[] = {"term", "-t", "spterm2", NULL };
const char *spcmd2[] = {"term", "-t", "spcalc1", "-e", "python3", "-q", NULL };
const char *spcmd3[] = {"keepassxc", NULL };
const char *spcmd4[] = {"term", "-t", "mail", "-e", "neomutt", NULL };
const char *spcmd5[] = {"weather", "show", NULL };
const char *spcmd6[] = {"term", "-t", "spalsa", "-e", "alsamixer", NULL };
const char *spcmd7[] = {"term", "-t", "spcale", "-e", "calcurse", NULL };
const char *spcmd8[] = {"term", "-t", "sptop", "-e", "htop", NULL };
const char *spcmd9[] = {"term", "-t", "spnode", "-e", "node", NULL };
const char *spcmd10[] = {"term", "-t", "spvim", "-e", "vim", NULL };
const char *spcmd11[] = {"term", "-t", "spcalc2", "-e", "octave-cli", "-q", NULL };
static Sp scratchpads[] = {
	/* name          cmd  */
	{"spterm1",     spcmd0},
	{"spterm2",     spcmd1},
	{"spcalc1",     spcmd2},
	{"keepassxc",   spcmd3},
	{"mail",        spcmd4},
	{"weather",     spcmd5},
	{"spalsa",      spcmd6},
	{"spcale",      spcmd7},
	{"sptop",       spcmd8},
	{"spnode",      spcmd9},
	{"spvim",       spcmd10},
	{"spcalc2",     spcmd11},
};

/* tagging */
static const char *tags[] = { "1", "2", "3", "4", "5", "6", "7", "8", "9" };
static const Rule rules[] = {
	/* xprop(1):
	 *	WM_CLASS(STRING) = instance, class
	 *	WM_NAME(STRING) = title
	 */
	/* class      instance    title       tags mask     isfloating   monitor */
	{ NULL,       NULL,       "spterm1",  SPTAG(0),         1,         -1 },
	{ NULL,       NULL,       "spterm2",  SPTAG(1),         1,         -1 },
	{ NULL,       NULL,       "spcalc1",  SPTAG(2),         1,         -1 },
	{ NULL,       "keepassxc",NULL,       SPTAG(3),         1,         -1 },
	{ NULL,       NULL,       "mail",     SPTAG(4),         1,         -1 },
	{ NULL,       NULL,       "weather",  SPTAG(5),         1,         -1 },
	{ NULL,       NULL,       "spalsa",   SPTAG(6),         1,         -1 },
	{ NULL,       NULL,       "spcale",   SPTAG(7),         1,         -1 },
	{ NULL,       NULL,       "sptop",    SPTAG(8),         1,         -1 },
	{ NULL,       NULL,       "spnode",   SPTAG(9),         1,         -1 },
	{ NULL,       NULL,       "spvim",    SPTAG(10),        1,         -1 },
	{ NULL,       NULL,       "spcalc2",  SPTAG(11),        1,         -1 },
};

/* layout(s) */
static const float mfact        = 0.55; /* factor of master area size [0.05..0.95] */
static const int nmaster        = 1;    /* number of clients in master area */
static const int resizehints    = 0;    /* 1 means respect size hints in tiled resizals */
static const int lockfullscreen = 1;    /* 1 will force focus on the fullscreen window */

static const Layout layouts[] = {
	/* symbol     arrange function */
	{ "[T]",      tile },    /* first entry is default */
	{ "[M]",      monocle },
	{ "[F]",      NULL },    /* no layout function means floating behavior */
};

/* key definitions */
#define MODKEY Mod4Mask
#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

/* commands */
static char dmenumon[2] = "0"; /* component of dmenucmd, manipulated in spawn() */
static const char *dmenucmd[] = { "dmenu_run", "-m", dmenumon, "-fn", dmenufont, "-nb", col_gray1, "-nf", col_gray3, "-sb", col_cyan, "-sf", col_gray4, NULL };
static const char *termcmd[]  = { "term", NULL };

#include <X11/XF86keysym.h>
static Key keys[] = {
	/* modifier                     key        function        argument */
	{ MODKEY,                       XK_p,      spawn,          {.v = dmenucmd } },
	{ MODKEY|ShiftMask,             XK_p,      spawn,          SHCMD("scrot") },
	{ MODKEY|ControlMask|ShiftMask, XK_p,      spawn,          SHCMD("tscrot") },
	{ MODKEY,                       XK_Return, spawn,          {.v = termcmd } },
	{ MODKEY,                       XK_b,      togglebar,      {0} },
	{ MODKEY,                       XK_j,      focusstack,     {.i = +1 } },
	{ MODKEY,                       XK_k,      focusstack,     {.i = -1 } },
	{ MODKEY,                       XK_i,      incnmaster,     {.i = +1 } },
	{ MODKEY,                       XK_d,      incnmaster,     {.i = -1 } },
	{ MODKEY,                       XK_h,      setmfact,       {.f = -0.05} },
	{ MODKEY,                       XK_l,      setmfact,       {.f = +0.05} },
	{ MODKEY,                       XK_semicolon,viewnext,     {0} },
	{ MODKEY,                       XK_g,      viewprev,       {0} },
	/* { MODKEY|ShiftMask,             XK_Right,  tagtonext,      {0} }, */
	/* { MODKEY|ShiftMask,             XK_Left,   tagtoprev,      {0} }, */
	{ MODKEY|ShiftMask,             XK_j,      zoom,           {0} },
	{ MODKEY,                       XK_Tab,    view,           {0} },
	{ MODKEY,                       XK_q,      killclient,     {0} },
	{ MODKEY,                       XK_t,      setlayout,      {.v = &layouts[0]} },
	{ MODKEY,                       XK_m,      setlayout,      {.v = &layouts[1]} },
	{ MODKEY,                       XK_f,      setlayout,      {.v = &layouts[2]} },
	{ MODKEY,                       XK_space,  setlayout,      {0} },
	{ MODKEY|ShiftMask,             XK_space,  togglefloating, {0} },
	{ MODKEY,                       XK_0,      view,           {.ui = ~0 } },
	{ MODKEY|ShiftMask,             XK_0,      tag,            {.ui = ~0 } },
	{ MODKEY,                       XK_comma,  focusmon,       {.i = -1 } },
	{ MODKEY,                       XK_period, focusmon,       {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_comma,  tagmon,         {.i = -1 } },
	{ MODKEY|ShiftMask,             XK_period, tagmon,         {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_Return, togglescratch,  {.ui = 0 } },
	{ MODKEY|ControlMask|ShiftMask, XK_Return, togglescratch,  {.ui = 1 } },
	{ MODKEY,                       XK_apostrophe,togglescratch,{.ui = 2} },
	{ MODKEY|ShiftMask,             XK_l,      togglescratch,  {.ui = 3 } },
	{ MODKEY|ShiftMask,             XK_m,      togglescratch,  {.ui = 4 } },
	{ MODKEY|ShiftMask,             XK_w,      togglescratch,  {.ui = 5 } },
	{ MODKEY|ShiftMask,             XK_a,      togglescratch,  {.ui = 6 } },
	{ MODKEY|ShiftMask,             XK_c,      togglescratch,  {.ui = 7 } },
	{ MODKEY|ShiftMask,             XK_h,      togglescratch,  {.ui = 8 } },
	{ MODKEY|ShiftMask,             XK_apostrophe,togglescratch,{.ui = 9} },
	{ MODKEY,                       XK_v,      togglescratch,  {.ui = 10} },
	{ MODKEY,                       XK_o,      togglescratch,  {.ui = 11} },
	TAGKEYS(                        XK_1,                      0)
	TAGKEYS(                        XK_2,                      1)
	TAGKEYS(                        XK_3,                      2)
	TAGKEYS(                        XK_4,                      3)
	TAGKEYS(                        XK_5,                      4)
	TAGKEYS(                        XK_6,                      5)
	TAGKEYS(                        XK_7,                      6)
	TAGKEYS(                        XK_8,                      7)
	TAGKEYS(                        XK_9,                      8)
	{ MODKEY|ControlMask|ShiftMask, XK_q,      quit,           {0} },

	{ MODKEY,                       XK_e,      spawn,          SHCMD("emoji") },

	{ 0,                            XF86XK_AudioMute,         spawn, SHCMD("amixer set Master toggle") },
	{ 0,                            XF86XK_AudioRaiseVolume,  spawn, SHCMD("amixer set Master 5%+") },
	{ 0,                            XF86XK_AudioLowerVolume,  spawn, SHCMD("amixer set Master 5%-") },
	{ 0,                            XF86XK_AudioMicMute,      spawn, SHCMD("amixer set Capture toggle") },
	{ 0,                            XF86XK_MonBrightnessDown, spawn, SHCMD("brightnessctl s 20-") },
	{ 0,                            XF86XK_MonBrightnessUp,   spawn, SHCMD("brightnessctl s 20+") },
	{ 0,                            XF86XK_WLAN,              spawn, SHCMD("wifi off") },
	//{ 0,                            XF86XK_WakeUp,            spawn, SHCMD("scrot") },
	{ 0,                            XF86XK_Display,           spawn, SHCMD("screen") },
	{ 0,                            XF86XK_Favorites,         spawn, SHCMD("slock") },
	{ MODKEY,                       XF86XK_Favorites,         spawn, SHCMD("panic") },
};

/* button definitions */
/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static Button buttons[] = {
	/* click                event mask      button          function        argument */
	{ ClkLtSymbol,          0,              Button1,        setlayout,      {0} },
	{ ClkLtSymbol,          0,              Button3,        setlayout,      {.v = &layouts[1]} },
	{ ClkWinTitle,          0,              Button2,        zoom,           {0} },
	{ ClkStatusText,        0,              Button2,        spawn,          {.v = termcmd } },
	{ ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} },
	{ ClkClientWin,         MODKEY,         Button2,        togglefloating, {0} },
	{ ClkClientWin,         MODKEY,         Button3,        resizemouse,    {0} },
	{ ClkTagBar,            0,              Button1,        view,           {0} },
	{ ClkTagBar,            0,              Button3,        toggleview,     {0} },
	{ ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
	{ ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
};

