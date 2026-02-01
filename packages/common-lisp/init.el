;;; common-lisp/init.el --- Common Lisp IDE Configuration -*- lexical-binding: t; -*-

;;; Commentary:
;; Comprehensive Common Lisp development environment with SLY, REPL, and debugging
;; Modeled after the Clojure configuration.

;;; Code:

;; Lisp mode for syntax highlighting and basic editing
(use-package lisp-mode
  :ensure nil ; Built-in
  :mode (("\\.lisp\\'" . lisp-mode)
         ("\\.cl\\'"   . lisp-mode)
         ("\\.asd\\'"  . lisp-mode))
  :hook (lisp-mode . common-lisp-ide-setup))

;; Common Lisp IDE setup function
(defun common-lisp-ide-setup ()
  "Configure IDE features for Common Lisp development."
  ;; Enable useful minor modes
  (subword-mode 1)              ; CamelCase word navigation
  (paredit-mode 1)              ; Structural editing
  (aggressive-indent-mode 1)    ; Auto-indent
  (rainbow-delimiters-mode 1)   ; Colorize parens
  
  ;; Company completion
  (company-mode 1))

;; SLY - Sylvester the Cat's Common Lisp IDE
(use-package sly
  :straight t
  :defer t
  :init
  (setq inferior-lisp-program "sbcl")
  :hook ((sly-mode . eldoc-mode)
         (sly-mrepl-mode . eldoc-mode)
         (sly-mrepl-mode . paredit-mode)
         (sly-mrepl-mode . rainbow-delimiters-mode))
  :config
  ;; REPL configuration
  (setq sly-mrepl-pop-to-buffer nil)
  (setq sly-net-coding-system 'utf-8-unix)
  
  ;; Customizations
  (setq sly-complete-symbol-function 'sly-flex-completions))

;; Ensure .lisp files are detected (fallback)
(add-to-list 'auto-mode-alist '("\\.lisp\\'" . lisp-mode))
(add-to-list 'auto-mode-alist '("\\.cl\\'" . lisp-mode))
(add-to-list 'auto-mode-alist '("\\.asd\\'" . lisp-mode))

;; Common Lisp keybindings (matching Clojure style)
(with-eval-after-load 'lisp-mode
  ;; REPL interaction
  (evil-define-key 'normal lisp-mode-map (kbd "<leader>rs") 'sly)
  (evil-define-key 'normal lisp-mode-map (kbd "<leader>rq") 'sly-quit-lisp)
  (evil-define-key 'normal lisp-mode-map (kbd "<leader>rr") 'sly-restart-inferior-lisp)
  (evil-define-key 'normal lisp-mode-map (kbd "<leader>rb") 'sly-mrepl-sync)
  
  ;; Evaluation
  (evil-define-key 'normal lisp-mode-map (kbd "<leader>ee") 'sly-eval-last-expression)
  (evil-define-key 'normal lisp-mode-map (kbd "<leader>ef") 'sly-eval-defun)
  (evil-define-key 'normal lisp-mode-map (kbd "<leader>eb") 'sly-eval-buffer)
  (evil-define-key 'normal lisp-mode-map (kbd "<leader>er") 'sly-eval-region)
  (evil-define-key 'normal lisp-mode-map (kbd "<leader>ep") 'sly-pprint-eval-last-expression)
  (evil-define-key 'normal lisp-mode-map (kbd "<leader>ei") 'sly-interrupt)
  
  ;; Navigation
  (evil-define-key 'normal lisp-mode-map (kbd "gd") 'sly-edit-definition)
  (evil-define-key 'normal lisp-mode-map (kbd "gr") 'sly-who-references)
  (evil-define-key 'normal lisp-mode-map (kbd "K") 'sly-documentation)
  (evil-define-key 'normal lisp-mode-map (kbd "<leader>gb") 'sly-pop-find-definition-stack)
  
  ;; Macroexpansion
  (evil-define-key 'normal lisp-mode-map (kbd "<leader>me") 'sly-macroexpand-1)
  (evil-define-key 'normal lisp-mode-map (kbd "<leader>mE") 'sly-macroexpand-all))

(provide 'common-lisp-init)
;;; common-lisp/init.el ends here
