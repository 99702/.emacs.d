;;; ide/init.el --- IDE Features Configuration -*- lexical-binding: t; -*-

;;; LSP Mode Configuration
(use-package lsp-mode
  :ensure t
  :commands lsp
  :hook ((typescript-mode js-mode web-mode typescript-ts-mode javascript-mode js-mode mhtml-mode) . lsp)
  :init (setq lsp-prefer-flymake nil))
(setq lsp-headerline-breadcrumb-enable nil)

(use-package lsp-ivy 
  :straight t
  :commands lsp-ivy-workspace-symbol)
(use-package lsp-treemacs 
  :straight t
  :commands lsp-treemacs-errors-list)

;; Performance optimizations for LSP
(setq lsp-log-io nil) ; Disable IO logging for better performance

;; Prettier JS formatter
(use-package prettier-js
  :straight t
  :defer t)

;; Yasnippet for code snippets
(use-package yasnippet
  :ensure t
  :straight t
  :hook (prog-mode . yas-minor-mode)
  :config
  (yas-reload-all))

(use-package yasnippet-snippets
  :ensure t
  :straight t
  :after yasnippet)

;; Company completion framework
(use-package company
  :ensure t
  :config
  (setq company-minimum-prefix-length 1
        company-idle-delay 0.0)
  (global-company-mode t))

;;; ide/init.el ends here
