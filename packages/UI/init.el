;;; UI/init.el --- Theme Configuration -*- lexical-binding: t; -*-

;; Allow loading themes without confirmation
(setq custom-safe-themes t)

;; Theme packages - deferred loading for better performance
(use-package doom-themes
  :ensure t
  :straight t
  :defer t)

(use-package spacemacs-theme
  :ensure t
  :defer t
  :straight t)

(use-package ef-themes
  :straight t
  :defer t)

(use-package standard-themes
  :straight t
  :defer t)

;; Load default theme
(load-theme 'modus-vivendi)

;;; UI/init.el ends here
