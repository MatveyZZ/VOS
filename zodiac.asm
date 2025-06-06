section .text
Aries:
    mov si, Aries_out
    ret
Taurus:
    mov si, Taurus_out
    ret
Gemini:
    mov si, Gemini_out
    ret
Cancer:
    mov si, Cancer_out
    ret
Leo:
    mov si, Leo_out
    ret
Virgo:
    mov si, Virgo_out
    ret
Libra:
    mov si, Libra_out
    ret
Scorpius:
    mov si, Scorpius_out
    ret
Sagittarius:
    mov si, Sagittarius_out
    ret
Capricorn:
    mov si, Capricorn_out
    ret
Aquarius:
    mov si, Aquarius_out
    ret
Pisces:
    mov si, Pisces_out
    ret

section .data
Aries_out db "   .-.   .-.", 0x0a, 0x0d,"  (_  \ /  _)    Aries-  The Ram", 0x0a, 0x0d,"       |", 0x0a, 0x0d,"       |", 0x0a, 0x0d, 0
Taurus_out db"    .     .", 0x0a, 0x0d,"    '.___.'      Taurus-  The Bull", 0x0a, 0x0d,"    .'   `.", 0x0a, 0x0d,"   :       :", 0x0a, 0x0d,"   :       :", 0x0a, 0x0d,"    `.___.'", 0x0a, 0x0d, 0
Gemini_out db "    ._____.", 0x0a, 0x0d,"      | |        Gemini-  The Twins", 0x0a, 0x0d,"      | |", 0x0a, 0x0d,"     _|_|_", 0x0a, 0x0d,"    '     '", 0x0a, 0x0d, 0
Cancer_out db "      .--.", 0x0a, 0x0d,"     /   _`.     Cancer-  The Crab", 0x0a, 0x0d,"    (_) ( )", 0x0a, 0x0d,"   '.    /", 0x0a, 0x0d,"     `--'", 0x0a, 0x0d, 0
Leo_out db"      .--.", 0x0a, 0x0d,"     (    )       Leo-  The Lion", 0x0a, 0x0d,"    (_)  /", 0x0a, 0x0d,"        (_,", 0x0a, 0x0d, 0
Virgo_out db "   _", 0x0a, 0x0d,"  ' `:--.--.", 0x0a, 0x0d,"     |  |  |_     Virgo-  The Virgin", 0x0a, 0x0d,"     |  |  | )", 0x0a, 0x0d,"     |  |  |/", 0x0a, 0x0d,"          (J", 0x0a, 0x0d, 0
Libra_out db "        __", 0x0a, 0x0d, "   ___.'  '.___   Libra-  The Balance", 0x0a, 0x0d,"   ____________", 0x0a, 0x0d, 0
Scorpius_out db "   _", 0x0a, 0x0d,"  ' `:--.--.", 0x0a, 0x0d,"     |  |  |      Scorpius-  The Scorpion", 0x0a, 0x0d,"     |  |  |", 0x0a, 0x0d,"     |  |  |  ..,", 0x0a, 0x0d,"           `---':", 0x0a, 0x0d, 0
Sagittarius_out db "          ...", 0x0a, 0x0d,"          .':     Sagittarius-  The Archer", 0x0a, 0x0d,"        .'", 0x0a, 0x0d,"    `..'", 0x0a, 0x0d,"    .'`.", 0x0a, 0x0d, 0
Capricorn_out db "            _", 0x0a, 0x0d,"    \      /_)    Capricorn-  The Goat", 0x0a, 0x0d,"     \    /`.", 0x0a, 0x0d,"      \  /   ;", 0x0a, 0x0d,"       \/ __.'", 0x0a, 0x0d, 0
Aquarius_out db " .-'-._.-'-._.-   Aquarius-  The Water Bearer", 0x0a, 0x0d," .-'-._.-'-._.-", 0x0a, 0x0d, 0
Pisces_out db "     `-.    .-'   Pisces-  The Fishes", 0x0a, 0x0d,"        :  :", 0x0a, 0x0d,"      --:--:--", 0x0a, 0x0d,"        :  :", 0x0a, 0x0d,"     .-'    `-.", 0x0a, 0x0d, 0

Aries_in db "Aries", 0
Taurus_in db "Taurus", 0
Gemini_in db "Gemini", 0
Cancer_in db "Cancer", 0
Leo_in db "Leo", 0
Virgo_in db "Virgo", 0
Libra_in db "Libra", 0
Scorpius_in db "Scorpius", 0
Sagittarius_in db "Sagittarius", 0
Capricorn_in db "Capricorn", 0
Aquarius_in db "Aquarius", 0
Pisces_in db "Pisces", 0

Callback_Aries:
    call Aries
    call out_string
    jmp input_loop
Callback_Taurus:
    call Taurus
    call out_string
    jmp input_loop
Callback_Gemini:
    call Gemini
    call out_string
    jmp input_loop
Callback_Cancer:
    call Cancer
    call out_string
    jmp input_loop
Callback_Leo:
    call Leo
    call out_string
    jmp input_loop
Callback_Virgo:
    call Virgo
    call out_string
    jmp input_loop
Callback_Libra:
    call Libra
    call out_string
    jmp input_loop
Callback_Scorpius:
    call Scorpius
    call out_string
    jmp input_loop
Callback_Sagittarius:
    call Sagittarius
    call out_string
    jmp input_loop
Callback_Capricorn:
    call Capricorn
    call out_string
    jmp input_loop
Callback_Aquarius:
    call Aquarius
    call out_string
    jmp input_loop
Callback_Pisces:
    call Pisces
    call out_string
    jmp input_loop

;ZODIAC_CALLBACK_OS:
    