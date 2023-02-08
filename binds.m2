let game_windowclass = "steam_app_1961950"; // <-- edit THIS to determine which game to rebind for!

// X11 active window class for a steam game (at least with Proton) is 'steam_app_<game id>'
// e.g. Chaos;Head Noah is 'steam_app_1961950'

let is_game_active = false;

let make_game_binds = || {
    /::f1;      // '?' with less steps, also shift is hide text
    b::f2;      // *B*acklog
    a::f3;      // *A*uto
    t::f4;      // you get the idea
    l::f5;
    s::f6;
    !l::f7;     // alt+L/S to quickload/save
    !s::f8;
    c::f9;
    KEY_ESC::1;
    KEY_END::KEY_ESC;
    KEY_TAB::KEY_BACKSPACE;
    j::];
    k::[;
    ,::z;       // delusion triggers
    .::c;

    is_game_active = true;
    print("Rebound keys!");
};

let undo_game_binds = || {
    /::/;
    b::b;
    a::a;
    t::t;
    l::l;
    s::s;
    !l::!l;
    !s::!s;
    c::c;
    KEY_CAPSLOCK::KEY_CAPSLOCK;
    KEY_END::KEY_END;
    KEY_TAB::KEY_TAB;
    j::j;
    k::k;
    ,::,;
    .::.;

    is_game_active = false;
    print("Keys un-rebound!");
};

on_window_change(|| {
    if(active_window_class() == game_windowclass) {
        make_game_binds();
    } else if (is_game_active) {
        undo_game_binds();
    }
});

