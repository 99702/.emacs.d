;;; tree sitter https://emacs-tree-sitter.github.io/
;; (use-package tree-sitter :ensure t :straight t)
;; (use-package tree-sitter-langs :ensure t :straight t)
;; (tree-sitter-require 'python)
;; (tree-sitter-require 'javascript)
;; (tree-sitter-require 'typescript)
;; (tree-sitter-require 'c)
;; (tree-sitter-require 'java)
;; (tree-sitter-require 'cpp)
;; (tree-sitter-require 'ruby)
;; (tree-sitter-require 'go)
;; (tree-sitter-require 'css)
;; (tree-sitter-require 'jsdoc)
;; (setq treesit-extra-load-path '("/usr/local/lib"))
;; (use-package tree-sitter-latex)
;; enable syntax highlighting whenever possible
;; (global-tree-sitter-mode)
;; (add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode)

;; (require 'treesit)
;; ----------------------------------------------------------------------------------
;; tree-sitter
;; ----------------------------------------------------------------------------------

;; M-x treesit-insrequire('tree-sitter-typescript').typescript; // TypeScript grammar
;; (dolist (language '(
;; 		    ("typescript" . "https://github.com/tree-sitter/tree-sitter-typescript.git")
;; 		    ("javascript" . "https://github.com/tree-sitter/tree-sitter-javascript.git")
;; 		    ))
;;   (add-to-list 'treesit-language-source-alist language)))

;; sh-mode use bash-ts-mode
;; (setq major-mode-remap-alist
;;       '((sh-mode . bash-ts-mode)
;;         (typescript-ts-mode . typescript-ts-mode)
;;         (javascript-mode . javascript-mode)
;;         (java-mode . java-mode)
;;         (json-mode . json-mode)
;;         (html-mode . html-mode)))


