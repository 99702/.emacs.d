(load "~/.emacs.d/packages/initialize.el")
(load "~/.emacs.d/packages/bindings.el")
(load "~/.emacs.d/config.el")
(load "~/.emacs.d/packages/UI/init.el")
(load "~/.emacs.d/packages/pulsar/init.el") 
(load "~/.emacs.d/packages/fontaine/init.el")
(load "~/.emacs.d/packages/tmr/init.el")
(load "~/.emacs.d/packages/all-the-icons/init.el")
(load "~/.emacs.d/packages/dashboard/init.el")
(load "~/.emacs.d/packages/projectile/init.el")
(load "~/.emacs.d/packages/treemacs/init.el")
(load "~/.emacs.d/packages/expand-region/init.el")
(load "~/.emacs.d/packages/marginalia/init.el")
(load "~/.emacs.d/packages/vterm/init.el")
(load "~/.emacs.d/packages/tree-sitter/init.el")
(load "~/.emacs.d/packages/which-key/init.el")
(load "~/.emacs.d/packages/vertico+consult/init.el")
(load "~/.emacs.d/packages/restclient.el/init.el")
(load "~/.emacs.d/packages/corfu/init.el")
(load "~/.emacs.d/packages/fun/init.el")



(load "~/.emacs.d/packages/ide/init.el") 

(display-battery-mode 1)

;; modeline				;
;; (display-battery-mode 1)
;; (setq mode-line-end-spaces
;;       '(""
;; 	(-3 "%p")
;; 	"|"
;; 	display-time-string
;; 	"|"	
;;         battery-mode-line-string
;; 	))
;; (defun my-mode-line/padding ()
;;   (let ((r-length (length (format-mode-line mode-line-end-spaces))))
;;     (propertize " "
;; 		'display `(space :align-to (- right ,r-length)))))

;; (setq mode-line-format
;;       (list
;;        "(%l %c) "
;;        ;; 'mode-line-mule-info
;;        'mode-line-modified
;;        'mode-line-frame-identification
;;        " | "
;;        "%b "
;;        ;; "|"
;;        ;; 'default-directory
;;        ;; " "
;;        ;; '(vc-mode vc-mode)		;
;;        " "
;;        '(:eval (my-mode-line/padding))
;;        'mode-line-end-spaces
;;   ))
;; (setq-default header-line-format mode-line-format)
;; (setq-default mode-line-format nil)


;; ;; update
;; (defun my-update-header ()
;;   (mapc
;;    (lambda (window)
;;      (with-current-buffer (window-buffer window)
;;        ;; don't mess with buffers that don't have a header line
;;        (when header-line-format
;;          (let ((original-format (get 'header-line-format 'original))
;;                (active-face 'modus-themes-intense-green)) ; change this to your favorite inactive header line face
;;            ;; if we didn't save original format yet, do it now
;;            (when (not original-format)
;;              (put 'header-line-format 'original header-line-format)
;;              (setq original-format header-line-format))
;;            ;; check if this window is selected, set faces accordingly
;;            (if (eq window (selected-window))
;;               (setq header-line-format original-format)
;;              (setq header-line-format `(:propertize ,original-format face ,active-face)))))))
;;    (window-list)))
;; (add-hook 'buffer-list-update-hook #'my-update-header)
