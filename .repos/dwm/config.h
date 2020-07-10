/* See LICENSE file for copyright and license details. */
// Sorry, I formatted this config by accident and don't want to fix it :P

/* appearance */
static const unsigned int borderpx = 3; /* border pixel of windows */
static const unsigned int snap = 32; /* snap pixel */
static const unsigned int gappih = 20; /* horiz inner gap between windows */
static const unsigned int gappiv = 10; /* vert inner gap between windows */
static const unsigned int gappoh = 10; /* horiz outer gap between windows and screen edge */
static const unsigned int gappov = 30; /* vert outer gap between windows and screen edge */
static const int swallowfloating = 0; /* 1 means swallow floating windows by default */
static const int smartgaps = 0; /* 1 means no outer gap when there is only one window */
static const int showbar = 0; /* 0 means no bar */
static const int topbar = 1; /* 0 means bottom bar */
static const char *fonts[] = { "Iosevka Term:pixelsize=14:antialias=true:autohint=true" };
static char dmenufont[] = "Iosevka Term:pixelsize=14:antialias=true:autohint=true";

static const char col_base00[] = "#282c34";
static const char col_base01[] = "#353b45";
static const char col_base02[] = "#3e4451";
static const char col_base03[] = "#545862";
static const char col_base04[] = "#565c64";
static const char col_base05[] = "#abb2bf";
static const char col_base06[] = "#b6bdca";
static const char col_base07[] = "#c8ccd4";
static const char col_base08[] = "#e06c75";
static const char col_base09[] = "#d19a66";
static const char col_base0A[] = "#e5c07b";
static const char col_base0B[] = "#98c379";
static const char col_base0C[] = "#56b6c2";
static const char col_base0D[] = "#61afef";
static const char col_base0E[] = "#c678dd";
static const char col_base0F[] = "#be5046";

static const char *colors[][3] = {
	/*               fg          bg          border   */
	[SchemeNorm] = { col_base05, col_base00, col_base02 },
	[SchemeSel] = { col_base05, col_base02, col_base05 },
};

typedef struct {
	const char *name;
	const void *cmd;
} Sp;
const char *spcmd1[] = { "st", "-n", "spterm", NULL };
const char *spcmd2[] = { "st", "-n", "spcalc", "-e", "python3", "-q", NULL };
const char *spcmd3[] = { "st", "-n", "splyri", "-e", "lyrics", "spotify", NULL };
static Sp scratchpads[] = {
	/* name          cmd  */
	{ "spterm", spcmd1 },
	{ "spcalc", spcmd2 },
	{ "splyri", spcmd3 },
};

/* tagging */
static const char *tags[] = { "1", "2", "3", "4", "5", "6", "7", "8", "9" };

static const Rule rules[] = {
	/* xprop(1):
	 *	WM_CLASS(STRING) = instance, class
	 *	WM_NAME(STRING) = title
	*/
	/* class                instance      title      tags mask    isfloating   isterminal  noswallow  monitor */
	{ "qutebrowser", NULL, NULL, 1 << 0, 0, 0, 0, -1 },
	{ "Spotify", NULL, NULL, 1 << 8, 0, 0, 0, -1 },
	{ "TelegramDesktop", NULL, NULL, 1 << 7, 0, 0, 0, -1 },
	{ "Signal", NULL, NULL, 1 << 7, 0, 0, 0, -1 },
	{ "discord", NULL, NULL, 1 << 7, 0, 0, 0, -1 },
	{ "Thunderbird", NULL, NULL, 1 << 6, 0, 0, 0, -1 },
	{ "St", NULL, NULL, 0, 0, 1, 0, -1 },
	{ NULL, "spterm", NULL, SPTAG(0), 1, 1, 0, -1 },
	{ NULL, "spcalc", NULL, SPTAG(1), 1, 1, 0, -1 },
	{ NULL, "splyri", NULL, SPTAG(2), 1, 1, 0, -1 },
	//{ NULL, NULL, "REPL", 1 << 2, 0, 1, 0, -1 },
	{ NULL, NULL, "WhatsApp", 1 << 7, 0, 0, 0, -1 },
};

/* layout(s) */
static const float mfact = 0.55; /* factor of master area size [0.05..0.95] */
static const int nmaster = 1; /* number of clients in master area */
static const int resizehints = 0; /* 1 means respect size hints in tiled resizals */
#define FORCE_VSPLIT 1 /* nrowgrid layout: force two clients to always split vertically */
#include "vanitygaps.c"
static const Layout layouts[] = {
	/* symbol     arrange function */
	{ "[t]", tile }, /* Default: Master on left, slaves on right */
	{ "[T]", bstack }, /* Master on top, slaves on bottom */

	{ "[s]", spiral }, /* Fibonacci spiral */
	{ "[S]", dwindle }, /* Decreasing in size right and leftward */

	{ "[d]", deck }, /* Master on left, slaves in monocle-like mode on right */
	{ "[D]", monocle }, /* All windows on top of eachother */

	{ "[c]", centeredmaster }, /* Master in middle, slaves on sides */
	{ "[C]", centeredfloatingmaster }, /* Same but master floats */

	{ "[F]", NULL }, /* no layout function means floating behavior */
	{ NULL, NULL },
};

/* key definitions */
#define MODKEY Mod4Mask
#define TAGKEYS(KEY, TAG)                                                                          \
	{ MODKEY, KEY, view, { .ui = 1 << TAG } },                                                 \
		{ MODKEY | ControlMask, KEY, toggleview, { .ui = 1 << TAG } },                     \
		{ MODKEY | ShiftMask, KEY, tag, { .ui = 1 << TAG } },                              \
		{ MODKEY | ControlMask | ShiftMask, KEY, toggletag, { .ui = 1 << TAG } },
#define STACKKEYS(MOD, ACTION)                                                                     \
	{ MOD, XK_j, ACTION##stack, { .i = INC(+1) } },                                            \
		{ MOD, XK_k, ACTION##stack, { .i = INC(-1) } },                                    \
		{ MOD,                                                                             \
		  XK_v,                                                                            \
		  ACTION##stack,                                                                   \
		  { .i = 0 } }, /* { MOD, XK_grave, ACTION##stack, {.i = PREVSEL } }, \ */
/* { MOD, XK_a,     ACTION##stack, {.i = 1 } }, \ */
/* { MOD, XK_z,     ACTION##stack, {.i = 2 } }, \ */
/* { MOD, XK_x,     ACTION##stack, {.i = -1 } }, */

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd)                                                                                 \
	{                                                                                          \
		.v = (const char *[])                                                              \
		{                                                                                  \
			"/bin/sh", "-c", cmd, NULL                                                 \
		}                                                                                  \
	}

/* commands */
static char dmenumon[2] = "0"; /* component of dmenucmd, manipulated in spawn() */
static const char *dmenucmd[] = { "dmenu_run", "-m",	   dmenumon,   "-fn",	   dmenufont,
				  "-nb",       col_base00, "-nf",      col_base05, "-sb",
				  col_base02,  "-sf",	   col_base05, NULL };
static const char *termcmd[] = { "st", NULL };

#include "shiftview.c"
#include <X11/XF86keysym.h>
static Key keys[] = {
	/* modifier                     key        function        argument */
	STACKKEYS(MODKEY, focus) STACKKEYS(MODKEY | ShiftMask, push) TAGKEYS(XK_1, 0)
		TAGKEYS(XK_2, 1) TAGKEYS(XK_3, 2) TAGKEYS(XK_4, 3) TAGKEYS(XK_5, 4) TAGKEYS(XK_6, 5)
			TAGKEYS(XK_7, 6) TAGKEYS(XK_8, 7)
				TAGKEYS(XK_9, 8){ MODKEY, XK_0, view, { .ui = ~0 } },
	{ MODKEY | ShiftMask, XK_0, tag, { .ui = ~0 } },

	{ MODKEY, XK_Tab, view, { 0 } },
	{ MODKEY, XK_q, killclient, { 0 } },
	{ MODKEY | ShiftMask, XK_b, spawn, SHCMD("$BROWSER") },
	{ MODKEY | ShiftMask, XK_r, spawn, SHCMD("st -e htop") },
	{ MODKEY, XK_t, setlayout, { .v = &layouts[0] } }, /* tile */
	{ MODKEY | ShiftMask, XK_t, setlayout, { .v = &layouts[1] } }, /* bstack */
	{ MODKEY, XK_y, setlayout, { .v = &layouts[2] } }, /* spiral */
	{ MODKEY | ShiftMask, XK_y, setlayout, { .v = &layouts[3] } }, /* dwindle */
	{ MODKEY, XK_u, setlayout, { .v = &layouts[4] } }, /* deck */
	{ MODKEY | ShiftMask, XK_u, setlayout, { .v = &layouts[5] } }, /* monocle */
	{ MODKEY, XK_i, setlayout, { .v = &layouts[6] } }, /* centeredmaster */
	{ MODKEY | ShiftMask, XK_i, setlayout, { .v = &layouts[7] } }, /* centeredfloatingmaster */
	{ MODKEY, XK_o, incnmaster, { .i = +1 } },
	{ MODKEY | ShiftMask, XK_o, incnmaster, { .i = -1 } },
	{ MODKEY, XK_backslash, view, { 0 } },

	{ MODKEY, XK_a, togglegaps, { 0 } },
	{ MODKEY | ShiftMask, XK_a, defaultgaps, { 0 } },
	{ MODKEY, XK_s, togglesticky, { 0 } },
	{ MODKEY, XK_p, spawn, { .v = dmenucmd } },
	{ MODKEY, XK_f, togglefullscr, { 0 } },
	{ MODKEY | ShiftMask, XK_f, setlayout, { .v = &layouts[8] } },
	{ MODKEY, XK_g, shiftview, { .i = -1 } },
	{ MODKEY | ShiftMask, XK_g, shifttag, { .i = -1 } },
	{ MODKEY, XK_h, setmfact, { .f = -0.05 } },
	/* J and K are automatically bound above in STACKEYS */
	{ MODKEY, XK_l, setmfact, { .f = +0.05 } },
	{ MODKEY, XK_semicolon, shiftview, { .i = 1 } },
	{ MODKEY | ShiftMask, XK_semicolon, shifttag, { .i = 1 } },
	{ MODKEY, XK_Return, spawn, { .v = termcmd } },
	{ MODKEY | ShiftMask, XK_Return, togglescratch, { .ui = 0 } },
	{ MODKEY, XK_apostrophe, togglescratch, { .ui = 1 } },
	{ MODKEY | ShiftMask, XK_l, togglescratch, { .ui = 2 } },

	{ MODKEY, XK_z, incrgaps, { .i = +3 } },
	{ MODKEY, XK_x, incrgaps, { .i = -3 } },
	/* V is automatically bound above in STACKKEYS */
	{ MODKEY, XK_b, togglebar, { 0 } },

	{ MODKEY, XK_space, zoom, { 0 } },
	{ MODKEY | ShiftMask, XK_space, togglefloating, { 0 } },

	{ 0, XF86XK_MonBrightnessUp, spawn, SHCMD("xbacklight -inc 15") },
	{ 0, XF86XK_MonBrightnessDown, spawn, SHCMD("xbacklight -dec 15") },
};

/* button definitions */
/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static Button buttons[] = {
	/* click                event mask      button          function        argument */
	{ ClkWinTitle, 0, Button2, zoom, { 0 } },
	{ ClkClientWin, MODKEY, Button1, movemouse, { 0 } },
	{ ClkClientWin, MODKEY, Button2, defaultgaps, { 0 } },
	{ ClkClientWin, MODKEY, Button3, resizemouse, { 0 } },
	{ ClkClientWin, MODKEY, Button4, incrgaps, { .i = +1 } },
	{ ClkClientWin, MODKEY, Button5, incrgaps, { .i = -1 } },
	{ ClkTagBar, 0, Button1, view, { 0 } },
	{ ClkTagBar, 0, Button3, toggleview, { 0 } },
	{ ClkTagBar, MODKEY, Button1, tag, { 0 } },
	{ ClkTagBar, MODKEY, Button3, toggletag, { 0 } },
	{ ClkTagBar, 0, Button4, shiftview, { .i = -1 } },
	{ ClkTagBar, 0, Button5, shiftview, { .i = 1 } },
	{ ClkRootWin, 0, Button2, togglebar, { 0 } },
};
