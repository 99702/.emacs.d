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
(scroll-lock-mode 1)
(pixel-scroll-precision-mode 1)
(setq show-paren-style 'expression)
(set-fringe-mode 0)
(set-language-environment "UTF-8")
(set-face-attribute 'default nil
		    :family "Cascadia Code PL"
		    :height 110
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

;; summertime
(define-minor-mode modus-themes-summertime
  "Refashion the Modus themes by overriding their colors.

This is a complete technology demonstration to show how to
manually override the colors of the Modus themes.  I have taken
good care of those overrides to make them work as a fully fledged
color scheme that is compatible with all user options of the
Modus themes.

These overrides are usable by those who (i) like something more
fancy than the comparatively austere looks of the Modus themes,
and (ii) can cope with a lower contrast ratio.

The overrides are set up as a minor mode, so that the user can
activate the effect on demand.  Those who want to load the
overrides at all times can either add them directly to their
configuration or enable `modus-themes-summertime' BEFORE loading
either of the Modus themes (if the overrides are evaluated after
the theme, the theme must be reloaded).

Remember that all changes to theme-related variables require a
reload of the theme to take effect (the Modus themes have lots of
user options, apart from those overrides).

The `modus-themes-summertime' IS NOT an official extension to the
Modus themes and DOES NOT comply with its lofty accessibility
standards.  It is included in the official manual as guidance for
those who want to make use of the color overriding facility we
provide."
  :init-value nil
  :global t
  (if modus-themes-summertime
      (setq modus-themes-operandi-color-overrides
            '((bg-main . "#fff0f2")
              (bg-dim . "#fbe6ef")
              (bg-alt . "#f5dae6")
              (bg-hl-line . "#fad8e3")
              (bg-active . "#efcadf")
              (bg-inactive . "#f3ddef")
              (bg-active-accent . "#ffbbef")
              (bg-region . "#dfc5d1")
              (bg-region-accent . "#efbfef")
              (bg-region-accent-subtle . "#ffd6ef")
              (bg-header . "#edd3e0")
              (bg-tab-active . "#ffeff2")
              (bg-tab-inactive . "#f8d3ef")
              (bg-tab-inactive-accent . "#ffd9f5")
              (bg-tab-inactive-alt . "#e5c0d5")
              (bg-tab-inactive-alt-accent . "#f3cce0")
              (fg-main . "#543f78")
              (fg-dim . "#5f476f")
              (fg-alt . "#7f6f99")
              (fg-unfocused . "#8f6f9f")
              (fg-active . "#563068")
              (fg-inactive . "#8a5698")
              (fg-docstring . "#5f5fa7")
              (fg-comment-yellow . "#a9534f")
              (fg-escape-char-construct . "#8b207f")
              (fg-escape-char-backslash . "#a06d00")
              (bg-special-cold . "#d3e0f4")
              (bg-special-faint-cold . "#e0efff")
              (bg-special-mild . "#c4ede0")
              (bg-special-faint-mild . "#e0f0ea")
              (bg-special-warm . "#efd0c4")
              (bg-special-faint-warm . "#ffe4da")
              (bg-special-calm . "#f0d3ea")
              (bg-special-faint-calm . "#fadff9")
              (fg-special-cold . "#405fb8")
              (fg-special-mild . "#407f74")
              (fg-special-warm . "#9d6f4f")
              (fg-special-calm . "#af509f")
              (bg-completion . "#ffc5e5")
              (bg-completion-subtle . "#f7cfef")
              (red . "#ed2f44")
              (red-alt . "#e0403d")
              (red-alt-other . "#e04059")
              (red-faint . "#ed4f44")
              (red-alt-faint . "#e0603d")
              (red-alt-other-faint . "#e06059")
              (green . "#217a3c")
              (green-alt . "#417a1c")
              (green-alt-other . "#006f3c")
              (green-faint . "#318a4c")
              (green-alt-faint . "#518a2c")
              (green-alt-other-faint . "#20885c")
              (yellow . "#b06202")
              (yellow-alt . "#a95642")
              (yellow-alt-other . "#a06f42")
              (yellow-faint . "#b07232")
              (yellow-alt-faint . "#a96642")
              (yellow-alt-other-faint . "#a08042")
              (blue . "#275ccf")
              (blue-alt . "#475cc0")
              (blue-alt-other . "#3340ef")
              (blue-faint . "#476ce0")
              (blue-alt-faint . "#575ccf")
              (blue-alt-other-faint . "#3f60d7")
              (magenta . "#bf317f")
              (magenta-alt . "#d033c0")
              (magenta-alt-other . "#844fe4")
              (magenta-faint . "#bf517f")
              (magenta-alt-faint . "#d053c0")
              (magenta-alt-other-faint . "#846fe4")
              (cyan . "#007a9f")
              (cyan-alt . "#3f709f")
              (cyan-alt-other . "#107f7f")
              (cyan-faint . "#108aaf")
              (cyan-alt-faint . "#3f80af")
              (cyan-alt-other-faint . "#3088af")
              (red-active . "#cd2f44")
              (green-active . "#116a6c")
              (yellow-active . "#993602")
              (blue-active . "#475ccf")
              (magenta-active . "#7f2ccf")
              (cyan-active . "#007a8f")
              (red-nuanced-bg . "#ffdbd0")
              (red-nuanced-fg . "#ed6f74")
              (green-nuanced-bg . "#dcf0dd")
              (green-nuanced-fg . "#3f9a4c")
              (yellow-nuanced-bg . "#fff3aa")
              (yellow-nuanced-fg . "#b47232")
              (blue-nuanced-bg . "#e3e3ff")
              (blue-nuanced-fg . "#201f6f")
              (magenta-nuanced-bg . "#fdd0ff")
              (magenta-nuanced-fg . "#c0527f")
              (cyan-nuanced-bg . "#dbefff")
              (cyan-nuanced-fg . "#0f3f60")
              (bg-diff-heading . "#b7cfe0")
              (fg-diff-heading . "#041645")
              (bg-diff-added . "#d6f0d6")
              (fg-diff-added . "#004520")
              (bg-diff-changed . "#fcefcf")
              (fg-diff-changed . "#524200")
              (bg-diff-removed . "#ffe0ef")
              (fg-diff-removed . "#891626")
              (bg-diff-refine-added . "#84cfa4")
              (fg-diff-refine-added . "#002a00")
              (bg-diff-refine-changed . "#cccf8f")
              (fg-diff-refine-changed . "#302010")
              (bg-diff-refine-removed . "#da92b0")
              (fg-diff-refine-removed . "#500010")
              (bg-diff-focus-added . "#a6e5c6")
              (fg-diff-focus-added . "#002c00")
              (bg-diff-focus-changed . "#ecdfbf")
              (fg-diff-focus-changed . "#392900")
              (bg-diff-focus-removed . "#efbbcf")
              (fg-diff-focus-removed . "#5a0010"))
            modus-themes-vivendi-color-overrides
            '((bg-main . "#25152a")
              (bg-dim . "#2a1930")
              (bg-alt . "#382443")
              (bg-hl-line . "#332650")
              (bg-active . "#463358")
              (bg-inactive . "#2d1f3a")
              (bg-active-accent . "#50308f")
              (bg-region . "#5d4a67")
              (bg-region-accent . "#60509f")
              (bg-region-accent-subtle . "#3f285f")
              (bg-header . "#3a2543")
              (bg-tab-active . "#26162f")
              (bg-tab-inactive . "#362647")
              (bg-tab-inactive-accent . "#36265a")
              (bg-tab-inactive-alt . "#3e2f5a")
              (bg-tab-inactive-alt-accent . "#3e2f6f")
              (fg-main . "#debfe0")
              (fg-dim . "#d0b0da")
              (fg-alt . "#ae85af")
              (fg-unfocused . "#8e7f9f")
              (fg-active . "#cfbfef")
              (fg-inactive . "#b0a0c0")
              (fg-docstring . "#c8d9f7")
              (fg-comment-yellow . "#cf9a70")
              (fg-escape-char-construct . "#ff75aa")
              (fg-escape-char-backslash . "#dbab40")
              (bg-special-cold . "#2a3f58")
              (bg-special-faint-cold . "#1e283f")
              (bg-special-mild . "#0f3f31")
              (bg-special-faint-mild . "#0f281f")
              (bg-special-warm . "#44331f")
              (bg-special-faint-warm . "#372213")
              (bg-special-calm . "#4a314f")
              (bg-special-faint-calm . "#3a223f")
              (fg-special-cold . "#c0b0ff")
              (fg-special-mild . "#bfe0cf")
              (fg-special-warm . "#edc0a6")
              (fg-special-calm . "#ff9fdf")
              (bg-completion . "#502d70")
              (bg-completion-subtle . "#451d65")
              (red . "#ff5f6f")
              (red-alt . "#ff8f6d")
              (red-alt-other . "#ff6f9d")
              (red-faint . "#ffa0a0")
              (red-alt-faint . "#f5aa80")
              (red-alt-other-faint . "#ff9fbf")
              (green . "#51ca5c")
              (green-alt . "#71ca3c")
              (green-alt-other . "#51ca9c")
              (green-faint . "#78bf78")
              (green-alt-faint . "#99b56f")
              (green-alt-other-faint . "#88bf99")
              (yellow . "#f0b262")
              (yellow-alt . "#f0e242")
              (yellow-alt-other . "#d0a272")
              (yellow-faint . "#d2b580")
              (yellow-alt-faint . "#cabf77")
              (yellow-alt-other-faint . "#d0ba95")
              (blue . "#778cff")
              (blue-alt . "#8f90ff")
              (blue-alt-other . "#8380ff")
              (blue-faint . "#82b0ec")
              (blue-alt-faint . "#a0acef")
              (blue-alt-other-faint . "#80b2f0")
              (magenta . "#ff70cf")
              (magenta-alt . "#ff77f0")
              (magenta-alt-other . "#ca7fff")
              (magenta-faint . "#e0b2d6")
              (magenta-alt-faint . "#ef9fe4")
              (magenta-alt-other-faint . "#cfa6ff")
              (cyan . "#30cacf")
              (cyan-alt . "#60caff")
              (cyan-alt-other . "#40b79f")
              (cyan-faint . "#90c4ed")
              (cyan-alt-faint . "#a0bfdf")
              (cyan-alt-other-faint . "#a4d0bb")
              (red-active . "#ff6059")
              (green-active . "#64dc64")
              (yellow-active . "#ffac80")
              (blue-active . "#4fafff")
              (magenta-active . "#cf88ff")
              (cyan-active . "#50d3d0")
              (red-nuanced-bg . "#440a1f")
              (red-nuanced-fg . "#ffcccc")
              (green-nuanced-bg . "#002904")
              (green-nuanced-fg . "#b8e2b8")
              (yellow-nuanced-bg . "#422000")
              (yellow-nuanced-fg . "#dfdfb0")
              (blue-nuanced-bg . "#1f1f5f")
              (blue-nuanced-fg . "#bfd9ff")
              (magenta-nuanced-bg . "#431641")
              (magenta-nuanced-fg . "#e5cfef")
              (cyan-nuanced-bg . "#042f49")
              (cyan-nuanced-fg . "#a8e5e5")
              (bg-diff-heading . "#304466")
              (fg-diff-heading . "#dae7ff")
              (bg-diff-added . "#0a383a")
              (fg-diff-added . "#94ba94")
              (bg-diff-changed . "#2a2000")
              (fg-diff-changed . "#b0ba9f")
              (bg-diff-removed . "#50163f")
              (fg-diff-removed . "#c6adaa")
              (bg-diff-refine-added . "#006a46")
              (fg-diff-refine-added . "#e0f6e0")
              (bg-diff-refine-changed . "#585800")
              (fg-diff-refine-changed . "#ffffcc")
              (bg-diff-refine-removed . "#952838")
              (fg-diff-refine-removed . "#ffd9eb")
              (bg-diff-focus-added . "#1d4c3f")
              (fg-diff-focus-added . "#b4dfb4")
              (bg-diff-focus-changed . "#424200")
              (fg-diff-focus-changed . "#d0daaf")
              (bg-diff-focus-removed . "#6f0f39")
              (fg-diff-focus-removed . "#eebdba")))))

;; change modeline
;; (setq modus-themes-mode-line '(accented))
;; (setq modus-themes-mode-line '(borderless 3d))
(setq modus-themes-region '(bg-only))
(setq modus-themes-completions '((matches . (extrabold))
                                 (selection . (semibold accented))
                                 (popup . (accented intense))))

(setq modus-themes-bold-constructs t)
(setq modus-themes-italic-constructs t)
(setq modus-themes-paren-match '(bold intense))
(setq modus-themes-syntax '(alt-syntax green-strings))
;; (load-theme 'modus-operandi)
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
(modus-themes-load-vivendi)


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
         "🏋️  " "")
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
(setq indent-tabs-mode nil)
(setq-default c-basic-offset 4)

;; enable date time
(display-time)
(setq display-time-day-and-date t)


;;; modeline
;; move mode-line to top
(display-battery-mode 1)
(setq mode-line-end-spaces
      '(""
	(-3 "%p")
	"|"
	display-time-string
	"|"	
        battery-mode-line-string
	))
(defun my-mode-line/padding ()
  (let ((r-length (length (format-mode-line mode-line-end-spaces))))
    (propertize " "
		'display `(space :align-to (- right ,r-length)))))

(setq mode-line-format
      (list
       "(%l %c) "
       ;; 'mode-line-mule-info
       'mode-line-modified
       'mode-line-frame-identification
       " | "
       "%b "
       "|"
       'default-directory
       " "
       '(vc-mode vc-mode)
       " "
       '(:eval (my-mode-line/padding))
       'mode-line-end-spaces
  ))
(setq-default header-line-format mode-line-format)
(setq-default mode-line-format nil)


;; update
(defun my-update-header ()
  (mapc
   (lambda (window)
     (with-current-buffer (window-buffer window)
       ;; don't mess with buffers that don't have a header line
       (when header-line-format
         (let ((original-format (get 'header-line-format 'original))
               (inactive-face 'modus-themes-diff-refine-removed)) ; change this to your favorite inactive header line face
           ;; if we didn't save original format yet, do it now
           (when (not original-format)
             (put 'header-line-format 'original header-line-format)
             (setq original-format header-line-format))
           ;; check if this window is selected, set faces accordingly
           (if (eq window (selected-window))
               (setq header-line-format original-format)
             (setq header-line-format `(:propertize ,original-format face ,inactive-face)))))))
   (window-list)))
(add-hook 'buffer-list-update-hook #'my-update-header)




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

