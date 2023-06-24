;;; tmr-autoloads.el --- automatically extracted autoloads (do not edit)   -*- lexical-binding: t -*-
;; Generated by the `loaddefs-generate' function.

;; This file is part of GNU Emacs.

;;; Code:



;;; Generated autoloads from tmr.el

(autoload 'tmr "tmr" "\
Set timer to TIME duration and notify after it elapses.

When TIME is a number, it is interpreted as a count of minutes.
Otherwise TIME must be a string that consists of a number and a
special final character denoting a unit of time: h for hours, s
for seconds.

With optional DESCRIPTION as a prefix (\\[universal-argument]),
prompt for a description among `tmr-description-list', though
allow for any string to serve as valid input.

With optional ACKNOWLEDGEP non-nil the timer must be acknowledged
after it finished, such that the timer cannot be missed.

This command also plays back `tmr-sound-file' if it is available.

To cancel the timer, use the `tmr-cancel' command.

To always prompt for a DESCRIPTION when setting a timer, use the
command `tmr-with-details' instead of this one.

(fn TIME &optional DESCRIPTION ACKNOWLEDGEP)" t)
(autoload 'tmr-with-details "tmr" "\
Set timer to TIME duration and notify after it elapses.

See `tmr' for a description of the arguments DESCRIPTION and
ACKNOWLEDGEP.  The difference between the two commands is that
`tmr-with-details' always asks for a description and if the timer
should be acknowledged whereas `tmr' only asks for it when the
user uses a prefix argument (\\[universal-argument]).

(fn TIME &optional DESCRIPTION ACKNOWLEDGEP)" t)
 (autoload 'tmr-prefix-map "tmr" nil t 'keymap)
(register-definition-prefixes "tmr" '("tmr-"))


;;; Generated autoloads from tmr-tabulated.el

(autoload 'tmr-tabulated-view "tmr-tabulated" "\
Open a tabulated list buffer listing tmr timers." t)
(register-definition-prefixes "tmr-tabulated" '("tmr-"))

;;; End of scraped data

(provide 'tmr-autoloads)

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; no-native-compile: t
;; coding: utf-8-emacs-unix
;; End:

;;; tmr-autoloads.el ends here