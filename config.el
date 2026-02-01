;;; config.el --- General Emacs Configuration -*- lexical-binding: t; -*-

;;; Commentary:
;; Core Emacs configuration including UI, editing behavior, and general settings

;;; Code:

;; Default UI configurations

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
(setq show-paren-style 'expression)
(set-fringe-mode 0)
(set-language-environment "UTF-8")
(electric-pair-mode t)




;;; Startup
(setq inhibit-startup-message 0)
(setq initial-buffer-choice  nil)
(setq initial-buffer-choice (lambda () (get-buffer "*dashboard*")))

;; npm error
(setq create-lockfiles nil)


;; Highlight line mode

(setq make-backup-files nil) 
(setq auto-save-default nil) 


;;display line number / relative line number
(add-hook 'prog-mode-hook 'display-line-numbers-mode)
(setq display-line-numbers-type 'relative)

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

;; Enable Tab Bar Mode
(tab-bar-mode 1)

(setq tab-bar-close-button-show nil
      tab-bar-new-button-show nil)

;; Custom tab bar formatting

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

;; Highlight line mode

(global-hl-line-mode)

;; display time
(display-time-mode 1)

;;use spaces instead of tabs
(setq indent-tabs-mode t)
(setq typescript-indent-level 2)
(setq js-indent-level 2)
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

;; Hide Emacs customize in separate file

(setq custom-file "~/.emacs.d/custom.el")
(when (file-exists-p custom-file)
  (load custom-file))

;; ignore \n irritating electric-indent-mode
(setq electric-indent-chars (delq ?\n electric-indent-chars))


;; disable the display of warnings
(setq warning-minimum-level :emergency)


;; dired hide details
(add-hook 'dired-mode-hook 'dired-hide-details-mode)

;; jump to next opposite when end buffer
(setq windmove-wrap-around t)

(provide 'config)
;;; config.el ends here
