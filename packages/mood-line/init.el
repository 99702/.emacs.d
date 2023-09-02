(use-package mood-line
  :config
  (mood-line-mode))

(setq mood-line-glyph-alist mood-line-glyphs-ascii)
(setq mood-line-glyph-alist mood-line-glyphs-fira-code)
(setq mood-line-glyph-alist mood-line-glyphs-unicode)
(display-battery-mode 1)
