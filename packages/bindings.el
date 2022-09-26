(use-package evil
  :init
  (setq evil-want-keybinding nil))
(use-package evil-collection
  :init
  (setq evil-want-keybinding nil))

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
(evil-define-key nil 'global (kbd "<f5>") 'modus-themes-toggle)


;; open


;; search things



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

(evil-define-key 'normal 'global (kbd "<leader>.") 'treemacs-select-window) 
(evil-define-key nil 'global (kbd "<leader>ws") 'switch-to-buffer)
(evil-define-key nil 'global (kbd "<leader>wb") 'consult-buffer)
(evil-define-key nil 'global (kbd "<leader>wf") 'toggle-frame-fullscreen)
(evil-define-key nil 'global (kbd "<leader>wt") 'toggle-frame-tab-bar)
(evil-define-key nil 'global (kbd "<leader>wk") 'kill-buffer)

;; tab bar mode
(evil-define-key nil 'global (kbd "<leader>t1") 'tab-bar-close-other-tabs)
(evil-define-key nil 'global (kbd "<leader>t2") 'tab-new)
(evil-define-key nil 'global (kbd "<leader>t0") 'tab-close)
(evil-define-key nil 'global (kbd "<leader>tn") 'tab-duplicate)
(evil-define-key nil 'global (kbd "<leader>tu") 'tab-undo)
(evil-define-key nil 'global (kbd "<leader>tr") 'tab-rename)


(evil-define-key nil 'global (kbd "<leader>th") 'tab-previous)
(evil-define-key nil 'global (kbd "<leader>tl") 'tab-next)

(define-key evil-normal-state-map (kbd ".") 'projectile-find-file)
(define-key evil-normal-state-map (kbd ",") 'consult-ripgrep)
(define-key evil-normal-state-map (kbd "<leader>ee") 'cider-eval-last-sexp)
(define-key evil-normal-state-map (kbd "<leader>n") 'evil-jump-item)


