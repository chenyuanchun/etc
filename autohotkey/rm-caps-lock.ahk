#IfWinActive ahk_class Emacs  ; if in emacs

+Capslock::Capslock ; make shift+Caps-Lock the Caps Lock toggle
Capslock::Control   ; make Caps Lock the control button
#IfWinActive 				; if in emacs