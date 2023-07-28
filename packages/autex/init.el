(use-package auctex
  :ensure t
  :defer t
  :hook (LaTeX-mode . (lambda ()
			(push (list 'output-pdf "Zathura")
			      TeX-view-program-selection))))
(add-hook 'doc-view-mode-hook 'auto-revert-mode)

(defun run-save-latex-to-pdf ()
  "Run save-latex-to-pdf macro when saving a LaTeX file."
  (when (eq major-mode 'latex-mode)
    (save-latex-to-pdf)))

(add-hook 'after-save-hook #'run-save-latex-to-pdf)
