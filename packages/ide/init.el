(add-hook 'typescript-ts-mode 'eglot-ensure)
(add-hook 'javascript-mode 'eglot-ensure)
(add-hook 'typescript-mode 'eglot-ensure)
(add-hook 'html-mode 'eglot-ensure)
(add-hook 'js-ts-mode 'eglot-ensure)
(add-hook 'tsx-ts-mode 'eglot-ensure)
(add-hook 'js-mode 'eglot-ensure)


;; corfu , cape , orderless setup start

(use-package corfu
  :straight t
  ;; Optional customizations
  :custom
  (corfu-cycle t)                ;; Enable cycling for `corfu-next/previous'
  (corfu-auto t)                 ;; Enable auto completion
  ;; (corfu-auto-prefix 1)
  ;; (corfu-auto-delay 0.0)
  ;; (completion-styles '(orderless-fast))
  ;; (corfu-separator ?\s)          ;; Orderless field separator
  ;; (corfu-quit-at-boundary 'separator)   ;; Never quit at completion boundary
  ;; (corfu-quit-no-match 'separator)      ;; Never quit, even if there is no match
  ;; (corfu-preview-current nil)    ;; Disable current candidate preview
  (corfu-preselect 'prompt)      ;; Preselect the prompt
  ;; (corfu-on-exact-match nil)     ;; Configure handling of exact matches
  ;; (corfu-scroll-margin 5)        ;; Use scroll margin

  ;; Enable Corfu only for certain modes.
  ;; :hook ((prog-mode . corfu-mode)
  ;;        (shell-mode . corfu-mode)
  ;;        (eshell-mode . corfu-mode))

  :bind
  (:map corfu-map
        ("TAB" . corfu-next)
        ([tab] . corfu-next)
        ("S-TAB" . corfu-previous)
        ([backtab] . corfu-previous))

  :init
  (global-corfu-mode)
  ;; (corfu-history-mode)
  )

(use-package cape

  :straight t

  :init
  ;; Add `completion-at-point-functions', used by `completion-at-point'.
  (add-to-list 'completion-at-point-functions #'cape-dabbrev)
  (add-to-list 'completion-at-point-functions #'cape-file)
  ;;(add-to-list 'completion-at-point-functions #'cape-history)
  ;;(add-to-list 'completion-at-point-functions #'cape-keyword)
  ;;(add-to-list 'completion-at-point-functions #'cape-tex)
  ;;(add-to-list 'completion-at-point-functions #'cape-sgml)
  ;;(add-to-list 'completion-at-point-functions #'cape-rfc1345)
  ;;(add-to-list 'completion-at-point-functions #'cape-abbrev)
  ;;(add-to-list 'completion-at-point-functions #'cape-ispell)
  ;;(add-to-list 'completion-at-point-functions #'cape-dict)
  ;;(add-to-list 'completion-at-point-functions #'cape-symbol)
  ;;(add-to-list 'completion-at-point-functions #'cape-line)
)

;; corfu setup end 















;;;;;;;;;;;;;;;; clojure mode
(use-package clojure-mode
  :straight t
  )
;; (use-package rainbow-delimiters-mode)
(use-package clojure-mode-extra-font-locking
  :straight t
  )
;; (use-package aggressive-indent)
;; (use-package smartparens)
(use-package cider
  :straight t
  )

(add-hook 'clojure-mode-hook #'subword-mode)
(add-hook 'clojure-mode-hook #'smartparens-strict-mode)
;; (add-hook 'clojure-mode-hook #'rainbow-delimiters-mode)
(add-hook 'clojure-mode-hook #'aggressive-indent-mode)




