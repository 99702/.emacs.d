(use-package evil)
(use-package evil-collection)

;; leader keys
(evil-mode 1)
(evil-collection-init)

(evil-set-leader nil (kbd "SPC"))
(evil-set-leader 'normal (kbd "SPC"))


;; (evil-define-key 'normal 'global (kbd "<leader>fs") 'save-buffer) ;
(evil-define-key 'normal 'global (kbd "<leader>0") 'treemacs-select-window)
(evil-define-key nil 'global (kbd "<leader>tt") 'treemacs)
(evil-define-key nil 'global (kbd "<leader>p") 'projectile-command-map)
(evil-define-key nil 'global (kbd "<leader><spc>") 'projectile-find-file)


