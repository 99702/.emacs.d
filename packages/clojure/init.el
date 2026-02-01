;;; clojure/init.el --- Clojure IDE Configuration -*- lexical-binding: t; -*-

;;; Commentary:
;; Comprehensive Clojure development environment with CIDER, REPL, debugging, and testing

;;; Code:

;; Clojure mode for syntax highlighting and basic editing
(use-package clojure-mode
  :straight t
  :mode (("\\.clj\\'" . clojure-mode)
         ("\\.cljs\\'" . clojurescript-mode)
         ("\\.cljc\\'" . clojure-mode)
         ("\\.edn\\'" . clojure-mode))
  :hook ((clojure-mode . clojure-ide-setup)
         (clojurescript-mode . clojure-ide-setup))
  :config
  (setq clojure-align-forms-automatically t)
  (setq clojure-indent-style 'align-arguments))

;; Enhanced font-locking for Clojure
(use-package clojure-mode-extra-font-locking
  :straight t
  :after clojure-mode)

;; Clojure IDE setup function
(defun clojure-ide-setup ()
  "Configure IDE features for Clojure development."
  ;; Enable useful minor modes
  (subword-mode 1)              ; CamelCase word navigation
  (paredit-mode 1)              ; Structural editing
  (aggressive-indent-mode 1)    ; Auto-indent
  (rainbow-delimiters-mode 1)   ; Colorize parens
  
  ;; Company completion
  (company-mode 1))

;; CIDER - The Clojure Interactive Development Environment that Rocks
(use-package cider
  :straight t
  :defer t
  :hook ((cider-mode . eldoc-mode)
         (cider-repl-mode . eldoc-mode)
         (cider-repl-mode . paredit-mode)
         (cider-repl-mode . rainbow-delimiters-mode))
  :config
  ;; REPL configuration
  (setq cider-repl-display-help-banner nil)
  (setq cider-repl-pop-to-buffer-on-connect nil)
  (setq cider-repl-display-in-current-window nil)
  (setq cider-repl-use-pretty-printing t)
  (setq cider-repl-result-prefix ";; => ")
  
  ;; Evaluation configuration
  (setq cider-show-error-buffer 'only-in-repl)
  (setq cider-auto-select-error-buffer t)
  (setq cider-prompt-for-symbol nil)
  
  ;; Code evaluation inline
  (setq cider-overlays-use-font-lock t)
  (setq cider-use-overlays 'both)
  
  ;; Enable enlighten mode (show intermediate values)
  (setq cider-enlighten-mode t)
  
  ;; Save files on load
  (setq cider-save-file-on-load t)
  
  ;; Connection configuration
  (setq cider-preferred-build-tool 'clojure-cli) ; or 'lein
  (setq cider-allow-jack-in-without-project t)
  
  ;; Debugger
  (setq cider-debug-display-locals t))

;; ClojureScript support
(use-package cider-cljs
  :straight nil
  :after cider
  :config
  (setq cider-default-cljs-repl 'shadow))

;; Refactoring support
(use-package clj-refactor
  :straight t
  :after cider
  :hook (clojure-mode . clj-refactor-mode)
  :config
  (setq cljr-warn-on-eval nil)
  (setq cljr-eagerly-build-asts-on-startup nil)
  (cljr-add-keybindings-with-prefix "C-c C-m"))

;; Linting with clj-kondo
(use-package flycheck-clj-kondo
  :straight t
  :after flycheck
  :config
  (require 'flycheck-clj-kondo))

;; Paredit - Structural editing for S-expressions
(use-package paredit
  :straight t
  :hook ((clojure-mode . paredit-mode)
         (emacs-lisp-mode . paredit-mode)
         (lisp-mode . paredit-mode)
         (scheme-mode . paredit-mode)))

;; Aggressive indent - Keep code properly indented
(use-package aggressive-indent
  :straight t
  :hook (clojure-mode . aggressive-indent-mode))

;; Rainbow delimiters - Colorize nested parens
(use-package rainbow-delimiters
  :straight t
  :hook (prog-mode . rainbow-delimiters-mode))

;; Ensure .clj files are detected (fallback)
(add-to-list 'auto-mode-alist '("\\.clj\\'" . clojure-mode))
(add-to-list 'auto-mode-alist '("\\.cljs\\'" . clojurescript-mode))
(add-to-list 'auto-mode-alist '("\\.cljc\\'" . clojure-mode))
(add-to-list 'auto-mode-alist '("\\.edn\\'" . clojure-mode))

;; Clojure keybindings
(with-eval-after-load 'clojure-mode
  ;; REPL interaction
  (evil-define-key 'normal clojure-mode-map (kbd "<leader>rj") 'cider-jack-in)
  (evil-define-key 'normal clojure-mode-map (kbd "<leader>rJ") 'cider-jack-in-cljs)
  (evil-define-key 'normal clojure-mode-map (kbd "<leader>rc") 'cider-connect)
  (evil-define-key 'normal clojure-mode-map (kbd "<leader>rq") 'cider-quit)
  (evil-define-key 'normal clojure-mode-map (kbd "<leader>rr") 'cider-restart)
  (evil-define-key 'normal clojure-mode-map (kbd "<leader>rb") 'cider-switch-to-repl-buffer)
  
  ;; Evaluation
  (evil-define-key 'normal clojure-mode-map (kbd "<leader>ee") 'cider-eval-last-sexp)
  (evil-define-key 'normal clojure-mode-map (kbd "<leader>ef") 'cider-eval-defun-at-point)
  (evil-define-key 'normal clojure-mode-map (kbd "<leader>eb") 'cider-eval-buffer)
  (evil-define-key 'normal clojure-mode-map (kbd "<leader>er") 'cider-eval-region)
  (evil-define-key 'normal clojure-mode-map (kbd "<leader>ep") 'cider-pprint-eval-last-sexp)
  (evil-define-key 'normal clojure-mode-map (kbd "<leader>ei") 'cider-interrupt)
  
  ;; Testing
  (evil-define-key 'normal clojure-mode-map (kbd "<leader>tt") 'cider-test-run-test)
  (evil-define-key 'normal clojure-mode-map (kbd "<leader>tn") 'cider-test-run-ns-tests)
  (evil-define-key 'normal clojure-mode-map (kbd "<leader>tp") 'cider-test-run-project-tests)
  (evil-define-key 'normal clojure-mode-map (kbd "<leader>tr") 'cider-test-rerun-test)
  (evil-define-key 'normal clojure-mode-map (kbd "<leader>tf") 'cider-test-rerun-failed-tests)
  (evil-define-key 'normal clojure-mode-map (kbd "<leader>ts") 'cider-test-show-report)
  
  ;; Debugging
  (evil-define-key 'normal clojure-mode-map (kbd "<leader>db") 'cider-debug-defun-at-point)
  (evil-define-key 'normal clojure-mode-map (kbd "<leader>di") 'cider-inspect-last-result)
  (evil-define-key 'normal clojure-mode-map (kbd "<leader>dI") 'cider-inspect)
  
  ;; Navigation
  (evil-define-key 'normal clojure-mode-map (kbd "gd") 'cider-find-var)
  (evil-define-key 'normal clojure-mode-map (kbd "gr") 'cider-find-references)
  (evil-define-key 'normal clojure-mode-map (kbd "K") 'cider-doc)
  (evil-define-key 'normal clojure-mode-map (kbd "<leader>gb") 'cider-pop-back)
  
  ;; Code formatting
  (evil-define-key 'normal clojure-mode-map (kbd "<leader>cf") 'cider-format-buffer)
  (evil-define-key 'normal clojure-mode-map (kbd "<leader>cr") 'cider-format-region)
  (evil-define-key 'normal clojure-mode-map (kbd "<leader>cd") 'cider-format-defun)
  
  ;; Namespace operations
  (evil-define-key 'normal clojure-mode-map (kbd "<leader>nr") 'cider-ns-refresh)
  (evil-define-key 'normal clojure-mode-map (kbd "<leader>na") 'cider-ns-reload-all)
  
  ;; Macroexpansion
  (evil-define-key 'normal clojure-mode-map (kbd "<leader>me") 'cider-macroexpand-1)
  (evil-define-key 'normal clojure-mode-map (kbd "<leader>mE") 'cider-macroexpand-all)
  
  ;; Code actions
  (evil-define-key 'normal clojure-mode-map (kbd "<leader>ca") 'cider-code-action-quickref-at-point))


;; Additional paredit keybindings for easier structural editing
(with-eval-after-load 'paredit
  ;; Slurp/barf
  (define-key paredit-mode-map (kbd "C->") 'paredit-forward-slurp-sexp)
  (define-key paredit-mode-map (kbd "C-<") 'paredit-forward-barf-sexp)
  (define-key paredit-mode-map (kbd "C-M->") 'paredit-backward-slurp-sexp)
  (define-key paredit-mode-map (kbd "C-M-<") 'paredit-backward-barf-sexp)
  
  ;; Raise/splice
  (define-key paredit-mode-map (kbd "M-r") 'paredit-raise-sexp)
  (define-key paredit-mode-map (kbd "M-s") 'paredit-splice-sexp))

(provide 'clojure-init)
;;; clojure/init.el ends here
