(load "~/.emacs.d/packages/eglot/init.el")

;; (add-to-list 'eglot-server-programs '(java-mode . ("/home/kali/.emacs.d/eclipse.jdt.ls" "-configuration" "config_linux" "-data" "/home/kali/.cache/jdtls"))) ;

;; (use-package eglot-java)
;; (eval-after-load 'eglot-java
;;   (progn
;;     (require 'eglot-java)
;;     '(eglot-java-init)))


;; lsp mode start
;; (setq read-process-output-max (* 1024 1024)) ;; 1mb
;; (setq lsp-log-io nil) ; if set to true can cause a performance hit
;; ;; (use-package markdown-mode)
;; (use-package lsp-mode
;;   :init
;;   ;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
;;   (setq lsp-keymap-prefix "C-c l")
;;   :hook (;; replace XXX-mode with concrete major-mode(e. g. python-mode)
;;          (typescript-mode . lsp)
;;          (javascript-mode . lsp)
;;          (python-mode . lsp)
;;          ;; if you want which-key integration
;;          (lsp-mode . lsp-enable-which-key-integration))
;;   :commands lsp)

;; ;; optionally
;; (use-package lsp-ui :commands lsp-ui-mode)
;; (use-package lsp-ivy :commands lsp-ivy-workspace-symbol)
;; (use-package lsp-treemacs :commands lsp-treemacs-errors-list)

;; ;; ;; optionally if you want to use debugger
;; (use-package dap-mode)
;; (use-package dap-typescript) ;; to load the dap adapter for your language

;; ;; (use-package flycheck)
;; (use-package yasnippet :config (yas-global-mode))
;; (use-package lsp-mode :hook ((lsp-mode . lsp-enable-which-key-integration))
;;   :config (setq lsp-completion-enable-additional-text-edit nil))
;; (use-package hydra)
;; ;; (use-package lsp-java :config (add-hook 'java-mode-hook 'lsp))
;; ;; (use-package dap-mode :after lsp-mode :config (dap-auto-configure-mode))
;; ;; (use-package lsp-treemacs)


;;; lsp mode end

(use-package rainbow-delimiters
  :ensure t)

(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)



;;;;;;;;;;;;;;;;;; typescript setup start
(use-package tide
  :ensure t
  :after (typescript-mode corfu flycheck)
  :hook ((typescript-mode . tide-setup)
         (typescript-mode . tide-hl-identifier-mode)
         (before-save . tide-format-before-save)))

(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)
  ;; company is an optional dependency. You have to
  ;; install it separately via package-install
  ;; `M-x package-install [ret] company`
 )

;; formats the buffer before saving
(add-hook 'before-save-hook 'tide-format-before-save)
(add-hook 'typescript-mode-hook #'setup-tide-mode)

(use-package typescript-mode
  :after tree-sitter
  :mode "\\.ts\\'"
  :config
  (setq typescript-indent-level 2))

(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)
  (corfu-mode +1)
  (make-local-variable 'completion-at-point-functions)
  (push (lambda () 'tide-completion-at-point) completion-at-point-functions))


;;;;;;;;;;;;;;;;;; typescript setup end




;;;;;;;;;;;;;;;; clojure mode
(use-package clojure-mode)
(use-package clojure-mode-extra-font-locking)
(use-package aggressive-indent)
(use-package smartparens)
(use-package cider)

(add-hook 'clojure-mode-hook #'subword-mode)
(add-hook 'clojure-mode-hook #'smartparens-strict-mode)
(add-hook 'clojure-mode-hook #'rainbow-delimiters-mode)
(add-hook 'clojure-mode-hook #'aggressive-indent-mode)
