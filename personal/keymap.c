#include QMK_KEYBOARD_H

#include "keymap_french.h"
#include <print.h>

#define RGB_MATRIX_STARTUP_MODE 
#define TG_NKRO MAGIC_TOGGLE_NKRO //Toggle 6KRO / NKRO mode

enum alt_keycodes {
    U_T_AUTO = SAFE_RANGE, //USB Extra Port Toggle Auto Detect / Always Active
    U_T_AGCR,              //USB Toggle Automatic GCR control
    DBG_TOG,               //DEBUG Toggle On / Off
    DBG_MTRX,              //DEBUG Toggle Matrix Prints
    DBG_KBD,               //DEBUG Toggle Keyboard Prints
    DBG_MOU,               //DEBUG Toggle Mouse Prints
    MD_BOOT,               //Restart into bootloader after hold timeout
    FLIP_IT, // (ノಠ痊ಠ)ノ彡┻━┻
    WHOKNOWS, // ¯\_(ツ)_/¯
    MOD_WIN,
    MOD_LUX,
    MOD_MAC,
};

enum unicode_names {
    AGRAV,
    MAGRAV,
    ET,
    MET,
    HEY,
    MHEY,
    UUU,
    MUUU,
    SSEY,
    MSSEY,
    EURO,
    AEU,
    MAEU,
    OEU,
    MOEU,
    APO,
    MAPO,
    UPO,
    MUPO,
    EPO,
    MEPO
};

const uint32_t PROGMEM unicode_map[] = {
    [AGRAV]  = 0xE0,  // à
    [MAGRAV] = 0xC0,  // À
    [ET] = 0xE9,  // é
    [MET] = 0xC9,  // É
    [HEY] = 0xE8,  // è
    [MHEY] = 0xC8,  // È
    [UUU] = 0xF9,  // ù
    [MUUU] = 0xD9,  // Ù
    [SSEY] = 0xE7,  // ç
    [MSSEY] = 0xC7,  // Ç
    [EURO]  = 0x20AC, // €
    [AEU] = 0xE6, // æ
    [MAEU] = 0xC6, // Æ
    [OEU] = 0x00, // œ
    [MOEU] = 0x00, // Œ
    [APO] = 0x00, // â
    [MAPO] = 0x00, // Â
    [UPO] = 0x00, // û
    [MUPO] = 0x00, // Û
    [EPO] = 0x00, // ê
    [MEPO] = 0x00, // Ê
    [OPO] = 0x00, // ô
    [MOPO] = 0x00, // Ô
};

enum layouts {
    DEFAULT,
    MACDEFA,
    FUN,
    ALT,
    SHIFTALT,
    CTRLSHIFTALT,
};

keymap_config_t keymap_config;

const uint16_t PROGMEM keymaps[][MATRIX_ROWS][MATRIX_COLS] = {
    [DEFAULT] = LAYOUT_65_ansi_blocker(
        KC_ESC,  KC_1,    KC_2,    KC_3,    KC_4,    KC_5,    KC_6,    KC_7,    KC_8,    KC_9,    KC_0,    KC_MINS, KC_EQL,  KC_BSPC, KC_DEL,  \
        KC_TAB,  KC_Q,    KC_W,    KC_E,    KC_R,    KC_T,    KC_Y,    KC_U,    KC_I,    KC_O,    KC_P,    KC_LBRC, KC_RBRC, KC_BSLS, KC_HOME, \
        KC_CAPS, KC_A,    KC_S,    KC_D,    KC_F,    KC_G,    KC_H,    KC_J,    KC_K,    KC_L,    KC_SCLN, KC_QUOT,           KC_ENT, KC_PGUP, \
        KC_LSFT, KC_Z,    KC_X,    KC_C,    KC_V,    KC_B,    KC_N,    KC_M,    KC_COMM, KC_DOT,  KC_SLSH, KC_RSFT,            KC_UP, KC_PGDN, \
        KC_LCTL, KC_LGUI, KC_LALT,                            KC_SPC,                             MO(ALT), MO(FUN), KC_LEFT, KC_DOWN, KC_RGHT  \
    ),
    [MACDEFA] = LAYOUT(
        _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, \
        _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, \
        _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______,          _______, _______, \
        _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______,          _______, _______, \
        _______, KC_LALT, KC_LGUI,                            _______,                            _______, _______, _______, _______, _______  \
    ),
    [FUN] = LAYOUT_65_ansi_blocker(
        KC_GRV,  KC_F1,   KC_F2,   KC_F3,   KC_F4,   KC_F5,   KC_F6,   KC_F7,   KC_F8,   KC_F9,   KC_F10,  KC_F11,  KC_F12,  _______, KC_MUTE, \
        _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, KC_PSCR, KC_SLCK, KC_PAUS, _______, KC_END, \
        _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______,          _______, KC_VOLU, \
        _______, _______, _______, _______, _______, MD_BOOT, _______, _______, _______, _______, _______, _______,          KC_PGUP, KC_VOLD, \
        _______, _______, _______,                            _______,                            _______, _______, KC_HOME, KC_PGDN, KC_END  \
    ),
    [ALT] = LAYOUT_65_ansi_blocker(
        _______, MOD_WIN, MOD_LUX, MOD_MAC, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, \
        _______,  X(AEU), X(EURO),   X(ET), _______, _______, _______,  X(UUU), _______,  X(OPO), _______, _______, _______, _______, _______, \
        _______,X(AGRAV), _______,  X(HEY), _______, _______, _______, _______, _______, _______, _______, _______,          _______, _______, \
   MO(SHIFTALT), _______, _______, X(SSEY), _______, _______, KC_TILD,  KC_GRV, _______, _______, _______, _______,          _______, _______, \
        _______, _______, _______,                            WHOKNOWS,                           _______, _______, _______, _______, _______  \
    ),
    [SHIFTALT] = LAYOUT_65_ansi_blocker(
        _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, \
        _______, X(MAEU), _______,  X(MET), _______, _______, _______, X(MUUU), _______, X(MOPO), _______, _______, _______, _______, _______, \
        _______,X(MAGRAV),_______, X(MHEY), _______, _______, _______, _______, _______, _______, _______, _______,          _______, _______, \
        _______, _______, _______,X(MSSEY), _______, _______, _______, _______, _______, _______, _______, _______,          _______, _______, \
        _______, _______, _______,                            FLIP_IT,                            _______, _______, _______, _______, _______  \
    ),
    [CTRLSHIFTALT] = LAYOUT_65_ansi_blocker(
        _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, \
        _______, X(MAEU), _______,  X(MET), _______, _______, _______, X(MUUU), _______, X(MOPO), _______, _______, _______, _______, _______, \
        _______,X(MAGRAV),_______, X(MHEY), _______, _______, _______, _______, _______, _______, _______, _______,          _______, _______, \
        _______, _______, _______,X(MSSEY), _______, _______, _______, _______, _______, _______, _______, _______,          _______, _______, \
        _______, _______, _______,                            FLIP_IT,                            _______, _______, _______, _______, _______  \
    ),
    /*
    [X] = LAYOUT(
        _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, \
        _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, \
        _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______,          _______, _______, \
        _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______,          _______, _______, \
        _______, _______, _______,                            _______,                            _______, _______, _______, _______, _______  \
    ),
    */
};

// Runs just one time when the keyboard initializes.
void matrix_init_user(void) {
    set_unicode_input_mode(UC_WINC);
};

// Runs constantly in the background, in a loop.
void matrix_scan_user(void) {
};

#define MODS_SHIFT  (get_mods() & MOD_BIT(KC_LSHIFT) || get_mods() & MOD_BIT(KC_RSHIFT))
#define MODS_CTRL  (get_mods() & MOD_BIT(KC_LCTL) || get_mods() & MOD_BIT(KC_RCTRL))
#define MODS_ALT  (get_mods() & MOD_BIT(KC_LALT) || get_mods() & MOD_BIT(KC_RALT))

bool process_record_user(uint16_t keycode, keyrecord_t *record) {
    static uint32_t key_timer;

    switch (keycode) {
        case MD_BOOT:
            if (record->event.pressed) {
                key_timer = timer_read32();
            } else {
                if (timer_elapsed32(key_timer) >= 500) {
                    reset_keyboard();
                }
            }
            return false;
        case FLIP_IT:
            if (record->event.pressed) {
                send_unicode_string("(ノಠ痊ಠ)ノ彡┻━┻");
            }
            return false;
        case WHOKNOWS:
            if (record->event.pressed) {
                send_unicode_string("¯\\_(ツ)_/¯");
            }
            return false;
        case MOD_WIN:
            if (record->event.pressed) {
                set_unicode_input_mode(UC_WINC);
                layer_off(MACDEFA);
            }
            return false;
        case MOD_LUX:
            if (record->event.pressed) {
                set_unicode_input_mode(UC_LNX);
                layer_off(MACDEFA);
            }
            return false;
        case MOD_MAC:
            if (record->event.pressed) {
                set_unicode_input_mode(UC_MAC);
                layer_on(MACDEFA);
            }
            return false;
        case KC_RALT:
        case KC_LSHIFT:
        case KC_LCTRL:
        default:
            return true; //Process all other keycodes normally
    }
}

led_instruction_t led_instructions[] = {
    { .flags = LED_FLAG_MATCH_LAYER | LED_FLAG_MATCH_ID | LED_FLAG_USE_RGB, .layer = DEFAULT, .id0 = 4294967295, .id1 = 4294967295, .id2 = 7, .r = 0, .g = 255, .b = 30 },

    { .flags = LED_FLAG_MATCH_LAYER | LED_FLAG_MATCH_ID | LED_FLAG_USE_RGB, .layer = FUN, .id0 = 8190, .r = 255, .g = 0, .b = 0},
    { .flags = LED_FLAG_MATCH_LAYER | LED_FLAG_MATCH_ID | LED_FLAG_USE_RGB, .layer = FUN, .id0 = 771768320, .id1 = 33687552, .r = 255, .g = 255, .b = 255},
    //{ .flags = LED_FLAG_MATCH_LAYER | LED_FLAG_MATCH_ID | LED_FLAG_USE_RGB, .layer = 1, .id0 = 2149515264, .id1 = 8207, .r = 255, .g = 255, .b = 0},

    { .flags = LED_FLAG_MATCH_LAYER | LED_FLAG_MATCH_ID | LED_FLAG_USE_RGB, .layer = ALT, .id0 = 2152136704, .id1 = 537690114, .r = 255, .g = 255, .b = 255},
    { .flags = LED_FLAG_MATCH_LAYER | LED_FLAG_MATCH_ID | LED_FLAG_USE_RGB, .layer = ALT, .id0 = 14, .r = 255, .g = 255, .b = 0 },

    { .flags = LED_FLAG_MATCH_LAYER | LED_FLAG_MATCH_ID | LED_FLAG_USE_RGB, .layer = SHIFTALT, .id0 = 2152005632, .id1 = 536903682, .r = 255, .g = 255, .b = 255},

    { .end = 1 }
};