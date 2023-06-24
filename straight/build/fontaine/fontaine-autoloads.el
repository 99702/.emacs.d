;;; fontaine-autoloads.el --- automatically extracted autoloads (do not edit)   -*- lexical-binding: t -*-
;; Generated by the `loaddefs-generate' function.

;; This file is part of GNU Emacs.

;;; Code:



;;; Generated autoloads from fontaine.el

(autoload 'fontaine-set-preset "fontaine" "\
Set font configurations specified in PRESET.
PRESET is a symbol that represents the car of a list in
`fontaine-presets'.  If there is only one available, apply it
outright, else prompt with completion.

Unless optional FRAME argument is supplied, apply the change to
all frames.  If FRAME satisfies `framep', then make the changes
affect only it.  If FRAME is non-nil, interpret it as the current
frame and apply the effects to it.

When called interactively with a universal prefix
argument (\\[universal-argument]), FRAME is interpreted as
non-nil.

Set `fontaine-current-preset' to PRESET.  Also see the command
`fontaine-apply-current-preset'.

(fn PRESET &optional FRAME)" t)
(autoload 'fontaine-apply-current-preset "fontaine" "\
Use `fontaine-set-preset' on `fontaine-current-preset'.
The value of `fontaine-current-preset' must be one of the keys in
`fontaine-presets'.

Re-applying the current preset is useful when a new theme is
loaded which overrides certain font families.  For example, if
the theme defines the `bold' face without a `:family', loading
that theme will make `bold' use the `default' family, even if the
`fontaine-presets' are configured to have different families
between the two.  In such a case, applying the current preset at
the post `load-theme' phase (e.g. via a hook) ensures that font
configurations remain consistent.

Some themes that provide hooks of this sort are the
`modus-themes', `ef-themes', `standard-themes' (all by
Protesilaos).  Alternatively, Emacs 29 provides the special
`enable-theme-functions' hook, which passes the THEME argument
for this function.

(fn &optional THEME)" t)
(autoload 'fontaine-set-face-font "fontaine" "\
Set font and/or other attributes of FACE.

When called interactively, prompt for FACE and then continue
prompting for the relevant face attributes each of which depends
on the FACE (for example, the `default' FACE accepts a family, a
height as a natural number, and a weight, whereas `bold' only
accepts a weight).

With regard to the font family that some faces accept, the
candidates are those specified in the user option
`fontaine-font-families'.  If none are specified, try to find
relevant installed fonts and provide them as completion
candidates.

Note that changing the `bold' and `italic' faces only has a
noticeable effect if the underlying does not hardcode a weight
and slant but inherits from those faces instead (e.g. the
`modus-themes').

When called from Lisp (albeit discouraged), if FACE is not part
of `fontaine--font-faces', fall back to interactively calling
`fontaine-set-preset'.

Unless optional FRAME argument is supplied, apply the change to
all frames.  If FRAME satisfies `framep', then make the changes
affect only it.  If FRAME is non-nil, interpret it as the current
frame and apply the effects to it.

When called interactively with a universal prefix
argument (\\[universal-argument]), FRAME is interpreted as
non-nil.

(fn FACE &optional FRAME)" t)
(function-put 'fontaine-set-face-font 'interactive-only 't)
(autoload 'fontaine-store-latest-preset "fontaine" "\
Write latest cursor state to `fontaine-latest-state-file'.
Can be assigned to `kill-emacs-hook'.")
(autoload 'fontaine-restore-latest-preset "fontaine" "\
Restore latest preset set by `fontaine-set-preset'.
The value is stored in `fontaine-latest-state-file'.")
(register-definition-prefixes "fontaine" '("fontaine-"))

;;; End of scraped data

(provide 'fontaine-autoloads)

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; no-native-compile: t
;; coding: utf-8-emacs-unix
;; End:

;;; fontaine-autoloads.el ends here