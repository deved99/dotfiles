(require 'base16-theme)

(defvar base16-custom-colors
  '(:base00 "{{ CS_BASE16[0] }}"
    :base01 "{{ CS_BASE16[1] }}"
    :base02 "{{ CS_BASE16[2] }}"
    :base03 "{{ CS_BASE16[3] }}"
    :base04 "{{ CS_BASE16[4] }}"
    :base05 "{{ CS_BASE16[5] }}"
    :base06 "{{ CS_BASE16[6] }}"
    :base07 "{{ CS_BASE16[7] }}"
    :base08 "{{ CS_BASE16[8] }}"
    :base09 "{{ CS_BASE16[9] }}"
    :base0A "{{ CS_BASE16[10] }}"
    :base0B "{{ CS_BASE16[11] }}"
    :base0C "{{ CS_BASE16[12] }}"
    :base0D "{{ CS_BASE16[13] }}"
    :base0E "{{ CS_BASE16[14] }}"
    :base0F "{{ CS_BASE16[15] }}")
  "All colors for Base16 Google Dark are defined here.")

;; Define the theme
(deftheme base16-custom)

;; Add all the faces to the theme
(base16-theme-define 'base16-custom base16-custom-colors)

;; Mark the theme as provided
(provide-theme 'base16-custom)

(provide 'base16-custom-theme)
