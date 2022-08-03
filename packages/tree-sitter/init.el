;;; tree sitter https://emacs-tree-sitter.github.io/
(use-package tree-sitter :ensure t)
(use-package tree-sitter-langs :ensure t)
(tree-sitter-require 'python)
(tree-sitter-require 'javascript)
(tree-sitter-require 'typescript)
(tree-sitter-require 'c)
(tree-sitter-require 'java)
(tree-sitter-require 'cpp)
(tree-sitter-require 'ruby)
(tree-sitter-require 'go)
(tree-sitter-require 'css)
(tree-sitter-require 'jsdoc)

;; enable syntax highlighting whenever possible
(global-tree-sitter-mode)
(add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode)
