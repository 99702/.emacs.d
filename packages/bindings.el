(use-package evil)
(use-package evil-collection)

;; leader keys
(evil-mode 1)
(evil-collection-init)

(evil-set-leader nil (kbd "SPC"))
(evil-set-leader 'normal (kbd "SPC"))

;; save
(evil-define-key nil 'global (kbd "<leader>s") 'save-buffer)

;; comment
(evil-define-key nil 'global (kbd "<leader>;") 'comment-line)
(evil-define-key nil 'global (kbd "<leader>:") 'comment-dwim)
(evil-define-key nil 'global (kbd "<leader>q") 'read-only-mode) ;read only mode


;; toggle commands
(evil-define-key nil 'global (kbd "<leader>tt") 'treemacs)
(evil-define-key nil 'global (kbd "<leader>mv") 'vterm-toggle)

(evil-define-key nil 'global (kbd "<leader>cf") 'fontaine-set-preset)
(evil-define-key nil 'global (kbd "<leader>ct") 'fontaine-set-preset)
;; open


;;(evil-define-key 'normal 'global (kbd "<leader>0") 'treemacs-select-window) ;
(evil-define-key nil 'global (kbd "<leader>p") 'projectile-command-map)
(evil-define-key nil 'global (kbd "<leader><spc>") 'projectile-find-file)

;; navigation (left , right, up , down )
(evil-define-key nil 'global (kbd "<leader>h") 'windmove-left)
(evil-define-key nil 'global (kbd "<leader>l") 'windmove-right)
(evil-define-key nil 'global (kbd "<leader>j") 'windmove-down)
(evil-define-key nil 'global (kbd "<leader>k") 'windmove-up)

; split, switch, kill windows
(evil-define-key nil 'global (kbd "<leader>0") 'delete-window)
(evil-define-key nil 'global (kbd "<leader>1") 'delete-other-windows)
(evil-define-key nil 'global (kbd "<leader>2") 'split-window-below)
(evil-define-key nil 'global (kbd "<leader>3") 'split-window-right)

(evil-define-key nil 'global (kbd "<leader>wb") 'consult-buffer)
(evil-define-key nil 'global (kbd "<leader>ws") 'switch-to-buffer)
(evil-define-key nil 'global (kbd "<leader>wk") 'kill-buffer)
