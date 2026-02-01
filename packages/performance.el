;;; performance.el --- Performance Optimizations -*- lexical-binding: t; -*-

;;; Commentary:
;; Centralized performance settings for faster Emacs startup and runtime

;;; Code:

;; Garbage collection optimization
;; GC threshold is set high in early-init.el and reset after startup
;; This value is used during normal operation (already set in early-init.el)

;; File name handler optimization
;; Temporarily disable file-name-handler-alist during startup for speed
(defvar default-file-name-handler-alist file-name-handler-alist)
(setq file-name-handler-alist nil)

;; Restore file-name-handler-alist after startup
(add-hook 'emacs-startup-hook
          (lambda ()
            (setq file-name-handler-alist default-file-name-handler-alist)))

;; Reduce rendering workload
(setq redisplay-skip-fontification-on-input t)

;; Increase the amount of data which Emacs reads from processes
(setq read-process-output-max (* 1024 1024)) ; 1MB

;; Disable bidirectional text scanning for slight performance boost
(setq-default bidi-display-reordering 'left-to-right
              bidi-paragraph-direction 'left-to-right)

;; Reduce frame resize cost
(setq frame-inhibit-implied-resize t)

;; Startup time reporting
(add-hook 'emacs-startup-hook
          (lambda ()
            (message "Emacs loaded in %s with %d garbage collections."
                     (emacs-init-time)
                     gcs-done)))

(provide 'performance)
;;; performance.el ends here
