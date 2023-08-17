(use-package auctex
  :ensure t
  :defer t
  :hook (LaTeX-mode . (lambda ()
			(push (list 'output-pdf "Zathura")
			      TeX-view-program-selection))))
(add-hook 'doc-view-mode-hook 'auto-revert-mode)

(add-hook 'TeX-mode-hook (lambda ()
                           (add-hook 'after-save-hook (lambda ()
                                                       (TeX-command-run-all nil))
                                     nil t)))
