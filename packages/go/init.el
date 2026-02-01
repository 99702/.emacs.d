;;; go/init.el --- Go Language IDE Configuration -*- lexical-binding: t; -*-

;;; Commentary:
;; Comprehensive Go development environment with tree-sitter, LSP, debugging, and testing

;;; Code:

;; Tree-sitter based Go mode (modern, faster syntax highlighting)
(use-package go-ts-mode
  :ensure nil  ; Built-in since Emacs 29
  :mode "\\.go\\'"
  :hook ((go-ts-mode . lsp-deferred)
         (go-ts-mode . go-ide-setup))
  :config
  (setq go-ts-mode-indent-offset 4))

;; Fallback to traditional go-mode if tree-sitter not available
(use-package go-mode
  :ensure t
  :mode "\\.go\\'"
  :hook ((go-mode . lsp-deferred)
         (go-mode . go-ide-setup)))

;; Go IDE setup function
(defun go-ide-setup ()
  "Configure IDE features for Go development."
  ;; Format code on save using goimports (better than gofmt, adds missing imports)
  (add-hook 'before-save-hook #'lsp-format-buffer nil t)
  (add-hook 'before-save-hook #'lsp-organize-imports nil t)
  
  ;; Enable useful minor modes
  (subword-mode 1)           ; CamelCase word navigation
  (electric-pair-local-mode 1) ; Auto-close brackets
  
  ;; Customize tab width
  (setq tab-width 4))

;; Enhanced LSP configuration for gopls
(with-eval-after-load 'lsp-mode
  (setq lsp-go-analyses '((shadow . t)
                          (simplifycompositelit . :json-false)
                          (unusedparams . t)
                          (unusedwrite . t)
                          (useany . t)
                          (unusedvariable . t)
                          (nilness . t)
                          (fieldalignment . t)))
  
  (setq lsp-go-codelenses '((generate . t)
                            (regenerate_cgo . t)
                            (test . t)
                            (tidy . t)
                            (upgrade_dependency . t)
                            (vendor . t)))
  
  ;; Inline hints (function parameter names, etc.)
  (setq lsp-go-use-placeholders t)
  (setq lsp-go-link-target "pkg.go.dev")
  
  ;; Build tags for conditional compilation
  ;; (setq lsp-go-build-flags ["-tags=integration"])
  
  ;; Environment variables for gopls
  (setq lsp-go-env '((GOFLAGS . "-tags=integration"))))

;; DAP (Debug Adapter Protocol) for debugging
(use-package dap-mode
  :straight t
  :after lsp-mode
  :config
  (dap-auto-configure-mode)
  (require 'dap-dlv-go)
  
  ;; Debug keybindings
  (evil-define-key 'normal 'go-ts-mode-map (kbd "<leader>db") 'dap-breakpoint-toggle)
  (evil-define-key 'normal 'go-ts-mode-map (kbd "<leader>dd") 'dap-debug)
  (evil-define-key 'normal 'go-ts-mode-map (kbd "<leader>dc") 'dap-continue)
  (evil-define-key 'normal 'go-ts-mode-map (kbd "<leader>dn") 'dap-next)
  (evil-define-key 'normal 'go-ts-mode-map (kbd "<leader>di") 'dap-step-in)
  (evil-define-key 'normal 'go-ts-mode-map (kbd "<leader>do") 'dap-step-out)
  (evil-define-key 'normal 'go-ts-mode-map (kbd "<leader>dr") 'dap-restart)
  (evil-define-key 'normal 'go-ts-mode-map (kbd "<leader>dq") 'dap-disconnect))

;; Go test integration
(use-package gotest
  :straight t
  :after go-mode
  :config
  ;; Test keybindings
  (evil-define-key 'normal 'go-ts-mode-map (kbd "<leader>tt") 'go-test-current-test)
  (evil-define-key 'normal 'go-ts-mode-map (kbd "<leader>tf") 'go-test-current-file)
  (evil-define-key 'normal 'go-ts-mode-map (kbd "<leader>tp") 'go-test-current-project)
  (evil-define-key 'normal 'go-ts-mode-map (kbd "<leader>tb") 'go-test-current-benchmark)
  (evil-define-key 'normal 'go-ts-mode-map (kbd "<leader>tc") 'go-test-current-coverage))

;; Go-specific snippets and expansions
(use-package go-snippets
  :straight t
  :after yasnippet)

;; Additional Go keybindings
(with-eval-after-load 'go-ts-mode
  ;; Code actions and refactoring
  (evil-define-key 'normal 'go-ts-mode-map (kbd "<leader>ca") 'lsp-execute-code-action)
  (evil-define-key 'normal 'go-ts-mode-map (kbd "<leader>cr") 'lsp-rename)
  
  ;; Documentation
  (evil-define-key 'normal 'go-ts-mode-map (kbd "K") 'lsp-describe-thing-at-point)
  
  ;; Imports
  (evil-define-key 'normal 'go-ts-mode-map (kbd "<leader>ia") 'go-import-add)
  (evil-define-key 'normal 'go-ts-mode-map (kbd "<leader>ig") 'lsp-organize-imports)
  
  ;; Go-specific commands
  (evil-define-key 'normal 'go-ts-mode-map (kbd "<leader>gf") 'gofmt)
  (evil-define-key 'normal 'go-ts-mode-map (kbd "<leader>gt") 'go-tag-add)
  (evil-define-key 'normal 'go-ts-mode-map (kbd "<leader>gT") 'go-tag-remove))

;; Go tag manipulation (for struct tags)
(use-package go-tag
  :straight t
  :after go-mode)

;; Better error handling and syntax checking
(use-package flycheck
  :ensure t
  :hook (go-ts-mode . flycheck-mode)
  :config
  (setq flycheck-check-syntax-automatically '(save mode-enabled)))

;; Code coverage visualization
(use-package go-coverage
  :straight (go-coverage :type git :host github :repo "ruscur/go-coverage")
  :after go-mode
  :config
  (evil-define-key 'normal 'go-ts-mode-map (kbd "<leader>tC") 'go-coverage))

(provide 'go-init)
;;; go/init.el ends here
