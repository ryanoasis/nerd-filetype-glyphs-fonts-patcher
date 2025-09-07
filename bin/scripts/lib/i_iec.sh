#!/usr/bin/env bash
# IEC Power Symbols (5 icons)
# Codepoints: 23FB-23FE 2B58
test -n "$__i_iec_loaded" && return || __i_iec_loaded=1
i='⏻' i_iec_power=$i
i='⏼' i_iec_toggle_power=$i
i='⏽' i_iec_power_on=$i
i='⏾' i_iec_sleep_mode=$i
i='⭘' i_iec_power_off=$i
unset i
