;;; projectile https://github.com/bbatsov/projectile


(use-package projectile
  :ensure t
  :init
  (projectile-mode +1)
  :bind (:map projectile-mode-map
	      ("\C-c p" . projectile-command-map)
	      ("M-9 " . projectile-command-map))
)

;; map key bindings for projectile
(global-set-key "\C-o" 'projectile-find-file)
