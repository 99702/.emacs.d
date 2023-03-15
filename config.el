;; default UI configurations

;;; getenv bashrc
(setq disabled-command-function nil)
(setq exec-path (append exec-path '("~/Programs/npm/bin")))
(let ((path (shell-command-to-string ". ~/.bashrc; echo -n $PATH")))
  (setenv "PATH" path)
  (setq exec-path 
        (append
         (split-string-and-unquote path ":")
         exec-path)))

(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(delete-selection-mode 1)
;; (scroll-lock-mode 1)
;; (pixel-scroll-precision-mode 1)
(setq show-paren-style 'expression)
(set-fringe-mode 0)
(set-language-environment "UTF-8")
(set-face-attribute 'default nil
		    :family "Iosevka Comfy"
		    ;; :height 110
		    :weight 'regular
		    :width 'normal)
(electric-pair-mode t)




;;; Startup
(setq inhibit-startup-message 0)
(setq initial-buffer-choice  nil)
(setq initial-buffer-choice (lambda () (get-buffer "*dashboard*")))

;; npm error
(setq create-lockfiles nil)



;; (setq powerline-arrow-shape 'curve)
;; (powerline-center-theme)

;; disable backup and things
(setq make-backup-files nil) 
(setq auto-save-default nil) 


;;display line number
(add-hook 'prog-mode-hook 'display-line-numbers-mode)
(setq linum-format "%3d ")

;; make ESC quit prompts
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

;; hs-minor-mode ; code folding
(add-hook 'prog-mode-hook #'hs-minor-mode)


;; sgml work on js-jsx-mode
(add-hook 'js-jsx-mode-hook
	  (lambda ()
	    (define-key js-jsx-mode-map (kbd "C-c C-f") 'sgml-skip-tag-forward)	    
	    (define-key js-jsx-mode-map (kbd "C-c C-b") 'sgml-skip-tag-backward)
	    )
	  )
;; mouse follow
(setq focus-follows-mouse t)
(setq mouse-autoselect-window t)

;;;;modus-vivendi /modus-operandi config


;; change modeline
(setq modus-themes-region '(bg-only))
(setq modus-themes-completions '((matches . (extrabold))
                                 (selection . (semibold accented))
                                 (popup . (accented intense))))

(setq modus-themes-bold-constructs t)
(setq modus-themes-italic-constructs t)
(setq modus-themes-paren-match '(bold intense))
(setq modus-themes-syntax '(alt-syntax green-strings))
(load-theme 'modus-operandi)
(modus-themes-load-themes)

;;make comments grayish
(defun my-modus-themes-custom-faces ()
  (modus-themes-with-colors
    (custom-set-faces
     ;; your custom face overrides here
     `(font-lock-comment-face ((,class :background ,bg-alt)))
     )))

(add-hook 'modus-themes-after-load-theme-hook #'my-modus-themes-custom-faces)
(modus-themes-load-operandi)


;;;;; enable tab bar mode
;; Don't turn on tab-bar-mode when tabs are created
(tab-bar-mode 1)
;; (setq tab-bar-format '(tab-bar-format-global)
;;       tab-bar-mode t)
;; (setq tab-bar-show 2)

(setq tab-bar-close-button-show nil
      tab-bar-new-button-show nil)

(defun my/tab-bar-format (tab i)
  (propertize
   (format
    (concat
     (if (eq (car tab) 'current-tab)
         "😚  " "")
     "%s")
    (alist-get 'name tab))
   'face (list (append
                '(:foreground "#FFFFFF")
                (if (eq (car tab) 'current-tab)
                    '(:box t)
                  '())))))
(setq tab-bar-tab-name-format-function #'my/tab-bar-format)

;; change name tab bar
(defun my/tab-bar-tab-name-function ()
  (let ((project (project-current)))
    (if project
        (project-root project)
      (tab-bar-tab-name-current))))

(setq tab-bar-tab-name-function #'my/tab-bar-tab-name-function)


;; switer to tab buffer
;; (defun my/switch-to-tab-buffer ()
;;   (interactive)
;;   (if (project-current)
;;       (call-interactively #'project-switch-to-buffer)
;;     (call-interactively #'switch-to-buffer)))

;; (global-set-key (kbd "C-x C-b") #'my/switch-to-tab-buffer)


;; highlight line mode
(global-hl-line-mode)

;; display time
(display-time-mode 1)

;;use spaces instead of tabs
(setq indent-tabs-mode t)
(setq typescript-indent-level 2)
;; (setq-default c-basic-offset 0)

;; enable date time
(display-time)
(setq display-time-day-and-date t)



;; toggle selective display
(global-set-key (kbd "C-z") 'set-selective-display-dlw)
(defun set-selective-display-dlw (&optional level)
"Fold text indented same of more than the cursor.
If level is set, set the indent level to LEVEL.
If 'selective-display' is already set to LEVEL, clicking
F5 again will unset 'selective-display' by setting it to 0."
  (interactive "P")
  (if (eq selective-display (1+ (current-column)))
      (set-selective-display 0)
    (set-selective-display (or level (1+ (current-column))))))


;;; re read from disk (on some external changes)
(global-auto-revert-mode)




;; tab-line-mode
;; (global-tab-line-mode)
;; (setq tab-line-close-button-show nil)  ;; do not show close button
;; (setq tab-line-separator "")  ;; set it to empty



;;;;  scroolling
;; (display-battery-mode 1)
;; (setq
;;  scroll-conservatively 1000                     ;; only 'jump' when moving this far
;;  scroll-margin 4                                ;; scroll N lines to screen edge
;;  scroll-step 1                                  ;; keyboard scroll one line at a time
;;  mouse-wheel-scroll-amount '(6 ((shift) . 1))   ;; mouse scroll N lines
;;  mouse-wheel-progressive-speed nil              ;; don't accelerate scrolling

;;  redisplay-dont-pause t                         ;; don't pause display on input

;;  ;; Always redraw immediately when scrolling,
;;  ;; more responsive and doesn't hang!
;;  fast-but-imprecise-scrolling nil
;;  jit-lock-defer-time 0
;;  )

;; hide emacs customize
(setq custom-file "~/.emacs.d/custom.el")
(when (file-exists-p custom-file)
  (load custom-file))
