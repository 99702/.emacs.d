;;; which key https://github.com/justbur/emacs-which-key
(use-package which-key
  :straight t
  :defer 0
  :diminish which-key-mode
  :config
  (which-key-mode)
  (setq which-key-idle-delay 1)
  (setq which-key-popup-type 'minibuffer)
  )
