;; -*- lexical-binding: t; -*-
;;; early-init.el --- Early initialization for performance

;; Increase GC threshold during startup for better performance
;; Will be reset after initialization completes
(setq gc-cons-threshold 100000000) ; 100MB

;; Disable package.el in favor of straight.el
(setq package-enable-at-startup nil)

;; Disable UI elements before frame creation for faster startup
(push '(menu-bar-lines . 0) default-frame-alist)
(push '(tool-bar-lines . 0) default-frame-alist)
(push '(vertical-scroll-bars) default-frame-alist)

;; Reset GC threshold after initialization
(add-hook 'emacs-startup-hook
          (lambda ()
            (setq gc-cons-threshold 20000000) ; 20MB
            (message "Emacs started in %s with %d garbage collections."
                     (emacs-init-time)
                     gcs-done)))

;; Load additional performance optimizations
(load (expand-file-name "packages/performance.el" user-emacs-directory))

;;; early-init.el ends here
