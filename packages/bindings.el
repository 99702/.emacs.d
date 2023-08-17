(use-package evil
  :straight t
  :init
  (setq evil-want-keybinding nil))

(use-package evil-collection
  :straight t
  :init
  (setq evil-want-keybinding nil))

;; Evil sorround start
(use-package evil-surround
  :straight t
  :ensure t
  :config
  (global-evil-surround-mode 1))

;; Evil matchit start
(use-package evil-matchit
  :straight t
  )
(global-evil-matchit-mode 1)

;; Evil string inflectionstart
(use-package evil-string-inflection 
:ensure t
:straight t)


;; leader keys
(evil-mode 1)
(evil-collection-init)

;; (evil-set-leader nil (kbd "SPC"))
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
(evil-define-key nil 'global (kbd "<leader>mp") 'projectile-run-vterm-other-window)

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



;; Evil snipe start 
;; (use-package evil-snipe
;;   :straight t
;;   )
;; (evil-snipe-override-mode 1)
;; Evil snipe end


;; Evil mc start 
;; (use-package evil-mc
;;   :straight t
;;   )
;; (global-evil-mc-mode  1) ;; enable
;; (evil-define-key 'visual evil-mc-key-map
;;   "A" #'evil-mc-make-cursor-in-visual-selection-end
;;   "I" #'evil-mc-make-cursor-in-visual-selection-beg)
;; Evil mc end


(evil-define-key nil  global-map (kbd "M-1") 'tab-bar-select-tab 0)
(evil-define-key nil  global-map (kbd "M-2") 'tab-bar-select-tab 1)
(evil-define-key nil  global-map (kbd "M-3") 'tab-bar-select-tab 2)
