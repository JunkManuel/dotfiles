# create a zkbd compatible hash;
# to add other keys to this hash, see: man 5 terminfo
typeset -g -A key

key[Home]="${terminfo[khome]}"
key[End]="${terminfo[kend]}"
key[Insert]="${terminfo[kich1]}"
key[Backspace]="${terminfo[kbs]}"
key[Delete]="${terminfo[kdch1]}"
key[Up]="${terminfo[kcuu1]}"
key[Down]="${terminfo[kcud1]}"
key[Left]="${terminfo[kcub1]}"
key[Right]="${terminfo[kcuf1]}"
key[PageUp]="${terminfo[kpp]}"
key[PageDown]="${terminfo[knp]}"
key[Shift-Tab]="${terminfo[kcbt]}"
key[Control-Left]="${terminfo[kLFT5]}"
key[Control-Right]="${terminfo[kRIT5]}"

# setup key accordingly
[[ -n "${key[Home]}"          ]] && bindkey -- "${key[Home]}"          beginning-of-line
[[ -n "${key[End]}"           ]] && bindkey -- "${key[End]}"           end-of-line
[[ -n "${key[Insert]}"        ]] && bindkey -- "${key[Insert]}"        overwrite-mode
[[ -n "${key[Backspace]}"     ]] && bindkey -- "${key[Backspace]}"     backward-delete-char
[[ -n "${key[Delete]}"        ]] && bindkey -- "${key[Delete]}"        delete-char
[[ -n "${key[Up]}"            ]] && bindkey -- "${key[Up]}"            up-line-or-history
# bindkey -- "K"		history-beginning-search-forward
# bindkey -- "L"		history-beginning-search-backward
[[ -n "${key[Down]}"          ]] && bindkey -- "${key[Down]}"          down-line-or-history
[[ -n "${key[Left]}"          ]] && bindkey -- "${key[Left]}"          backward-char
[[ -n "${key[Right]}"         ]] && bindkey -- "${key[Right]}"         forward-char
[[ -n "${key[PageUp]}"        ]] && bindkey -- "${key[PageUp]}"        beginning-of-buffer-or-history
[[ -n "${key[PageDown]}"      ]] && bindkey -- "${key[PageDown]}"      end-of-buffer-or-history
[[ -n "${key[Shift-Tab]}"     ]] && bindkey -- "${key[Shift-Tab]}"     reverse-menu-complete
[[ -n "${key[Control-Left]}"  ]] && bindkey -- "${key[Control-Left]}"  backward-word
[[ -n "${key[Control-Right]}" ]] && bindkey -- "${key[Control-Right]}" forward-word

# Finally, make sure the terminal is in application mode, when zle is
# active. Only then are the values from $terminfo valid.
if (( ${+terminfo[smkx]} && ${+terminfo[rmkx]} )); then
	autoload -Uz add-zle-hook-widget
	function zle_application_mode_start { echoti smkx }
	function zle_application_mode_stop { echoti rmkx }
	add-zle-hook-widget -Uz zle-line-init zle_application_mode_start
	add-zle-hook-widget -Uz zle-line-finish zle_application_mode_stop
fi

# Unbind movement keys on visual and normal(vicmd) modes
bindkey -M vicmd -r "h"
bindkey -M vicmd -r "j"
bindkey -M vicmd -r "J"
bindkey -M vicmd -r "k"
bindkey -M vicmd -r "K"
bindkey -M vicmd -r "l"
bindkey -M visual -r "h"
bindkey -M visual -r "j"
bindkey -M visual -r "J"
bindkey -M visual -r "k"
bindkey -M visual -r "K"
bindkey -M visual -r "l"

# bind Spanish Layout keys to movement shit
bindkey -M vicmd "j" vi-backward-char
bindkey -M vicmd "k" down-line-or-history
bindkey -M vicmd "l" up-line-or-history
bindkey -M vicmd "ñ" vi-forward-char
bindkey -M visual "j" vi-backward-char
bindkey -M visual "k" down-line-or-history
bindkey -M visual "l" up-line-or-history
bindkey -M visual "ñ" vi-forward-char

# Bind history int search on visual mode
bindkey -M vicmd 	"K"		history-beginning-search-forward
bindkey -M vicmd 	"L"		history-beginning-search-backward
bindkey -M visual 	"K"		history-beginning-search-forward
bindkey -M visual	"L"		history-beginning-search-backward
