;;; vterm https://github.com/akermu/emacs-libvterm
(use-package vterm
  :straight t
    :ensure t)
(use-package vterm-toggle
  :straight t
  :ensure t)

(keymap-global-set "C-x t v" 'vterm-toggle)
(add-to-list 'display-buffer-alist
             '((lambda(bufname _) (with-current-buffer bufname (equal major-mode 'vterm-mode)))
                (display-buffer-reuse-window display-buffer-at-bottom)
                ;;(display-buffer-reuse-window display-buffer-in-direction)
                ;;display-buffer-in-direction/direction/dedicated is added in emacs27
                (direction . bottom)
                ;;(dedicated . t) ;dedicated is supported in emacs27
                (reusable-frames . visible)
                (window-height . 0.2)))

(define-key vterm-mode-map (kbd "C-x t v")   'vterm-toggle)

;; hide modeline in vterm
(defun hide-modeline-in-vterm ()
  "Hide the modeline in vterm buffers."
  (setq-local mode-line-format nil))

(add-hook 'vterm-mode-hook 'hide-modeline-in-vterm)
