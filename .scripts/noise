#!/usr/bin/env bash
#              bash 4.1.5(1)     Linux Ubuntu 10.04           Date : 2011-09-11
#
# _______________|  noise : ambient Brown noise generator (cf. white noise).
#
#           Usage:  noise  [minutes=59]  [band-pass freq center=1786]  [wave]
#                          ^minutes can be any non-zero integer.
#
#    Dependencies:  play (from sox package)

#  Brownian noise, also known as Brown noise or red noise, is the kind of signal
#  noise produced by Brownian motion, hence its alternative name of random walk
#  noise. The term "Brown noise" does not originate from the color, but from 
#  Robert Brown who discovered Brownian motion.  Brown noise is produced by
#  integrating white noise.  The sound is a low roar resembling a waterfall or
#  heavy rainfall. We shall filter it through a band-pass, then add effects 
#  to mellow the output for ambience.

#  [/] - could increase volume oscillation (amplitude modulation) to simulate 
#           waves or breathing pattern -- but this could be too relaxing.
#           Hear the free online services listed at the end of file.
#           Our goal here is calm concentration in a noisy environment.


#  CHANGE LOG  Code posted at https://gist.github.com/1209835
#
#  2011-09-11  Repeat use of one-minute segment to cut CPU usage by 95%.
#                 Fix tremolo to give very slow wave oscillation in volume.
#                 (Thanks to xguse for his gist at github.)
#                 Constant volume introduces tension psychologically.
#  2011-09-10  First version based on 2009 article by Tom Swiss, and
#                 subsequent comments. See below for relevant portions.

#           _____ Prelims
set -u
#   ^ unbound (i.e. unassigned) variables shall be errors.
#           Example of default assignment:    arg1=${1:-'foo'}
set -e
#   ^ error checking :: Highly Recommended (caveat:  you can't check $? later).  
#
# _______________     ::  BEGIN  Script ::::::::::::::::::::::::::::::::::::::::

minutes=${1:-'59'}
repeats=$(( minutes - 1 ))
center=${2:-'1786'}

wave=${3:-'0.02'}
#         ^increase for more volume oscillation, but suggest no higher than 0.20

noise='brown'
#     ^your choice: 'white', 'pink', 'brown', 'tpdf'
#     where tpdf stands for Triangular Probability Density Function (cf. dither).
#     N.B. - white and pink noise have higher frequencies than Brown.

len='01:00'
#   ^CONSTANT one minute. (Format for specifying time length is hh:mm:ss.frac) 
#     ___ATTN___ We first pre-compute one minute of audio output to file, 
#     then playback repeatedly as necessary to satisfy minutes argument. 
#     This dramatically cuts CPU usage by 95% after the first minute.


echo " ::  Please stand-by... sox will 'play' $noise noise for $minutes minutes."


play --no-show-progress -c 2 --null synth $len  ${noise}noise  band -n $center 499 \
     tremolo $wave 37  reverb 19  repeat $repeats
     
#  #    Previously published one-line versions misused tremolo:
#  play -c 2 --null synth $len brownnoise band -n 1800 1400 tremolo 500 .1 reverb 50
#  play -c 2 --null synth $len brownnoise band -n 2500 4000 tremolo 20 .1 reverb 50
#  play --null synth $len brownnoise band -n 1200 200 tremolo 20 .1 reverb 20
#  play --null synth $len brownnoise band -n 1200 200 tremolo 20 .1


#            _____ ARGUMENTS explained via "man sox"

#       -q, --no-show-progress
#           Run in quiet mode when SoX wouldn't otherwise do so; this is
#           the opposite of the -S option.
#  
#       -S, --show-progress
#           Display input file format/header information, and processing
#           progress as input file(s) percentage complete, elapsed time,
#           and remaining time (if known; shown in brackets), and the
#           number of samples written to the output file.  Also shown is a
#           peak-level meter, and an indication if clipping has occurred.


#       -c 2
#           Two channels. Without this, the output is not stereo.


#       -n, --null
#           This can be used in place of an input or output filename to
#           specify that a `null file' is to be used.  Note that here,
#           `null file' refers to a SoX-specific mechanism and is not
#           related to any operating-system mechanism with a similar name.
#           Using a null file to input audio is equivalent to using a
#           normal audio file that contains an infinite amount of silence,
#           and as such is not generally useful unless used with an effect
#           that specifies a finite time length (such as trim or synth).


#       synth
#           Some noise options: whitenoise, tpdfnoise, pinknoise, brownnoise.


#       band [-n] center[k] [width[h|k|o|q]]
#           Apply a band-pass filter.  The frequency response drops
#           logarithmically around the center frequency.  The width
#           parameter gives the slope of the drop.  The frequencies at
#           center + width and center - width will be half of their
#           original amplitudes.  band defaults to a mode oriented to
#           pitched audio, i.e. voice, singing, or instrumental music.
#           The -n (for noise) option uses the alternate mode for un-
#           pitched audio (e.g. percussion).  Warning: -n introduces a
#           power-gain of about 11dB in the filter, so beware of output
#           clipping.  band introduces noise in the shape of the filter,
#           i.e. peaking at the center frequency and settling around it
#
#  Consider this for centering the band-pass...
#  
#  Freq (Hz)      Octave      Description
#  16   to   32   1st         Human threshold, the lowest pedal notes 
#                                of a pipe organ.
#  32   to  512   2nd to 5th  Rhythm frequencies, where the lower and upper 
#                                bass notes lie.
#  512  to 2048   6th to 7th  Defines human speech intelligibility, gives a 
#                                horn-like or tinny quality to sound.
#  2048 to 8192   8th to 9th  Gives presence to speech, where labial and 
#                                fricative sounds lie.
#  8192 to 16384  10th        Brilliance, the sounds of bells and the ringing 
#                                of cymbals. In speech, the sound of 
#                                the letter "S" (8000-11000 Hz)
#        Source:  http://en.wikipedia.org/wiki/Audio_frequency
#
#  Avoid the really low frequencies which will produce disturbing rumble.


#       tremolo speed [depth]
#           Apply a tremolo (low frequency amplitude modulation) effect to
#           the audio.  The tremolo frequency in Hz is given by speed, and
#           the depth as a percentage by depth (default 40). Increasing
#           the depth gives wider range between soft and loud volumes.


#       reverb [-w|--wet-only] [reverberance (50%) [HF-damping (50%)
#           [room-scale (100%) [stereo-depth (100%)
#           [pre-delay (0ms) [wet-gain (0dB)]]]]]]


#       repeat count
#           Repeat the entire audio count times.  Requires temporary file
#           space to store the audio to be repeated. [But where exactly?] 
             


#  _______________ "white noise" generator with sox [edited for code content]
#                   by Tom Swiss, http://unreasonable.org/node/303
#                   January 2007, updated circa September 2009,
#                   included comments through September 2011
#  
#  Sox is "the Swiss army knife of sound processing programs." It includes sound
#  generation capabilties for pure tones and white noise.  "Pink noise" is
#  also in sox's bag of tricks. After a bit of experimentation, I found the 
#  following shell script produced agreeable results:
#  
#  len='7:00:00'
#  play -t sl - synth $len pinknoise band -n 1200 200 tremolo 20 .1 < /dev/zero
#  
#       __________ Comments
#        
#  Drew Haven: This beats the heck out of "cat /dev/urandom > /dev/dsp". The band
#  filter is nice to take out the pops.
#  
#  gi1242: With recent versions of sox, things are a little simpler:
#       play -n synth 60:00 brownnoise
#  produces brown noise for an hour. (Replace brown with pink/white if you
#  prefer. My baby sleeps best with brown).
#  
#  Tom Swiss: "Brown" in "brown noise" means Brownian motion. It's also called
#  red noise. I learned something today, hooray!
#  
#  Adrien Beau, 30 January 2011: You can replace the "-t sl -" and "< /dev/zero"
#  parts with the "-n" option, so your sox invocation becomes:
#                  ^= --null (for null file)
#       play -n synth $len pinknoise band -n 1200 200 tremolo 20 .1
#  The brown noise sounds the best in my opinion.
#  
#  Dennis Murczak, 5 May 2011: I adapted the line to a "my neighbor is having a
#  party and I need to study" situation:
#       play -c 2 -n synth pinknoise band -n 2500 4000 reverb 20
#  The band pass is centered on human voice frequencies and wide enough to also
#  cover most of the musical frequency range, without producing annoying
#  high-pitched noise. The slight reverb adds a background/ambient quality for
#  less distraction. 


exit 0
# _______________ EOS ::  END of Script ::::::::::::::::::::::::::::::::::::::::


#           _____ Free ONLINE alternatives
#
#  Simply Noise for white, pink and brown/red noise generator; uses Flash:
#       http://simplynoise.com   $0.99 app available
#  [Flash consumes about 30 times more than our script in CPU usage!]
#
#  PlayNoise for white, pink, and brown noise generator; uses Javascript/HTML5:
#       http://playnoise.com


#           _____ References
#  Re: Brown noise, see http://en.wikipedia.org/wiki/Brownian_noise

