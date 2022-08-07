(setq comp-speed 3)
(load "~/.emacs.d/packages/initialize.el")
(load "~/.emacs.d/packages/bindings.el")
(load "~/.emacs.d/config.el")
(load "~/.emacs.d/packages/UI/init.el")
(load "~/.emacs.d/packages/pulsar/init.el") 
(load "~/.emacs.d/packages/fontaine/init.el")
(load "~/.emacs.d/packages/tmr/init.el")
(load "~/.emacs.d/packages/all-the-icons/init.el")
(load "~/.emacs.d/packages/dashboard/init.el")
(load "~/.emacs.d/packages/projectile/init.el")
(load "~/.emacs.d/packages/treemacs/init.el")
(load "~/.emacs.d/packages/expand-region/init.el")
(load "~/.emacs.d/packages/marginalia/init.el")
(load "~/.emacs.d/packages/vterm/init.el")
(load "~/.emacs.d/packages/tree-sitter/init.el")
(load "~/.emacs.d/packages/which-key/init.el")
(load "~/.emacs.d/packages/vertico+consult/init.el")
(load "~/.emacs.d/packages/restclient.el/init.el")
(load "~/.emacs.d/packages/corfu/init.el")


;; (load "~/.emacs.d/packages/multiple-cursors/init.el")
(load "~/.emacs.d/packages/ide/init.el") 

;; add emmet mode
(add-to-list 'load-path "~/.emacs.d/emmet-mode")
(require 'emmet-mode)
(add-hook 'sgml-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
(add-hook 'css-mode-hook  'emmet-mode) ;; enable Emmet's css abbreviation.
(add-hook 'html-mode-hook  'emmet-mode) ;; enable Emmet's css abbreviation.
