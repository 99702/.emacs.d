;;; lsp performancer
(setq comp-speed 3)
(setq gc-cons-threshold 100000000)
(setq read-process-output-max (* 1024 1024)) ;; 1mb
(load "~/.emacs.d/packages/eglot/init.el")

;;;;;;;;;;; company-mode start;;;;;;;;;;;;;;;;;;;;;;;
(use-package company
  :after lsp-mode
  :hook (lsp-mode . company-mode)
  :bind (:map company-active-map
         ("<tab>" . company-complete-selection))
        (:map lsp-mode-map
         ("<tab>" . company-indent-or-complete-common))
  :custom
  (company-minimum-prefix-length 1) 
  (company-idle-delay 0.0)
  )

(use-package company-box
  :hook (company-mode . company-box-mode))
;;;;;;;;;;; company-mode end;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;; lsp-mode start;;;;;;;;;;;;;;;;;;;;;;;
;; breadcrump
(defun efs/lsp-mode-setup ()
  (setq lsp-headerline-breadcrump-segments '(path-up-to-project file symbols))
  (lsp-headerline-breadcrumb-mode))

(use-package lsp-mode
	     :commands (lsp lsp-deferred)
  :init

  (setq lsp-keymap-prefix "C-c l")
  :hook (
         (javascript-mode . lsp)
         (html-mode . lsp)
         (css-mode . lsp)
         (typescript-mode . lsp)
         (python-mode . lsp)
	 (vterm-mode . lsp)
         (lsp-mode . lsp-enable-which-key-integration)
	 (lsp-mode . efs/lsp-mode-setup))
  :commands lsp
)

(use-package lsp-ui :commands lsp-ui-mode
	     :hook (lsp-mode. lsp-ui-mode)
	     :custom
	     (setq lsp-ui-doc-position 'top)
	     )
(use-package lsp-ivy :commands lsp-ivy-workspace-symbol)
(use-package lsp-treemacs :commands lsp-treemacs-errors-list :after lsp)
(use-package dap-mode)

;;;;;;;;;;; lsp-mode end;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;; typescript setup start;;;;;;;;;;;;;;;;;;;;;;;
(use-package typescript-mode
	     :mode "\\.ts\\'"
	     :hook (typescript-mode . lsp-deferred)
	     :config
	     (setq typescript-indent-level 2))




;;;;;;;;;;; typescript setup start;;;;;;;;;;;;;;;;;;;;;;;




;;;;;;;;;;;;;;;; clojure mode
(use-package clojure-mode)
;; (use-package rainbow-delimiters-mode)
(use-package clojure-mode-extra-font-locking)
(use-package aggressive-indent)
(use-package smartparens)
(use-package cider)

(add-hook 'clojure-mode-hook #'subword-mode)
(add-hook 'clojure-mode-hook #'smartparens-strict-mode)
;; (add-hook 'clojure-mode-hook #'rainbow-delimiters-mode)
(add-hook 'clojure-mode-hook #'aggressive-indent-mode)

