;;; projectile https://github.com/bbatsov/projectile


(use-package projectile
  :ensure t
  :straight t
  :init
  (projectile-mode +1)
  :bind (:map projectile-mode-map
	      ("\C-c p" . projectile-command-map)
	      )
)
(use-package ripgrep 
  :straight t)

;; map key bindings for projectile
;; (global-set-key "\C-o" 'projectile-find-file)
