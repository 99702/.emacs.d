;; (use-package corfu
;;   ;; Optional customizations
;;   :custom
;;   (corfu-cycle t)                ;; Enable cycling for `corfu-next/previous'
;;   (corfu-auto t)                 ;; Enable auto completion
;;   ;; (corfu-separator ?\s)          ;; Orderless field separator
;;   (corfu-quit-no-match t)      ;; Never quit, even if there is no match
;;   ;; (corfu-preview-current nil)    ;; Disable current candidate preview
;;   ;; (corfu-preselect-first nil)    ;; Disable candidate preselection
;;   ;; (corfu-on-exact-match nil)     ;; Configure handling of exact matches
;;   ;; (corfu-echo-documentation nil) ;; Disable documentation in the echo area
;;   (corfu-scroll-margin 5)        ;; Use scroll margin

;;   ;; You may want to enable Corfu only for certain modes.

;;   :hook (
;;   (prog-mode . corfu-mode)
;;   ;;        (shell-mode . corfu-mode)
;;          (vterm-mode . corfu-mode)
;;   )
;;   ;; Use TAB for cycling, default is `corfu-complete'.
;;   :bind
;;   (:map corfu-map
;;         ("TAB" . corfu-next)
;;         ([tab] . corfu-next)
;;         ("C-TAB" . corfu-previous)
;;         ([backtab] . corfu-previous))
 
;;   ;; Recommended: Enable Corfu globally.
;;   ;; This is recommended since dabbrev can be used globally (M-/).
;;   :init
;;   (global-corfu-mode)
;;   )
;; ;; Add extensions
;; (use-package cape
;;   ;; Bind dedicated completion commands
;;   ;; Alternative prefix keys: C-c p, M-p, M-+, ...
;;   :bind (("C-c p p" . completion-at-point) ;; capf
;;          ("C-c p t" . complete-tag)        ;; etags
;;          ("C-c p d" . cape-dabbrev)        ;; or dabbrev-completion
;;          ;; ("C-c p h" . cape-history)
;;          ;; ("C-c p f" . cape-file)
;;          ("C-c p k" . cape-keyword)
;;          ("C-c p s" . cape-symbol)
;;          ;; ("C-c p a" . cape-abbrev)
;;          ("C-c p i" . cape-ispell)
;;          ("C-c p l" . cape-line)
;;          ("C-c p w" . cape-dict)
;;          ;; ("C-c p \\" . cape-tex)
;;          ;; ("C-c p _" . cape-tex)
;;          ;; ("C-c p ^" . cape-tex)
;;          ("C-c p &" . cape-sgml)
;;          ("C-c p r" . cape-rfc1345))
;;   :init
;;   ;; Add `completion-at-point-functions', used by `completion-at-point'.
;;   ;; (add-to-list 'completion-at-point-functions #'cape-file)
;;   ;; (add-to-list 'completion-at-point-functions #'cape-dabbrev)
;;   ;;(add-to-list 'completion-at-point-functions #'cape-history)
;;   (add-to-list 'completion-at-point-functions #'cape-keyword)
;;   ;;(add-to-list 'completion-at-point-functions #'cape-tex)
;;   ;; (add-to-list 'completion-at-point-functions #'cape-sgml)
;;   ;;(add-to-list 'completion-at-point-functions #'cape-rfc1345)
;;   ;; (add-to-list 'completion-at-point-functions #'cape-abbrev)
;;   ;; (add-to-list 'completion-at-point-functions #'cape-ispell)
;;   ;; (add-to-list 'completion-at-point-functions #'cape-dict)
;;   (add-to-list 'completion-at-point-functions #'cape-symbol)
;;   (add-to-list 'completion-at-point-functions #'cape-line)
;;   :ensure t
;; )


;; ;; Use dabbrev with Corfu!
;; (use-package dabbrev
;;   ;; Swap M-/ and C-M-/
;;   :bind (("M-/" . dabbrev-completion)
;;          ("C-M-/" . dabbrev-expand)))

(use-package orderless
  :straight t
  :init
  ;; Configure a custom style dispatcher (see the Consult wiki)
  ;; (setq orderless-style-dispatchers '(+orderless-dispatch)
  ;;       orderless-component-separator #'orderless-escapable-split-on-space)
  (setq completion-styles '(orderless basic)
        completion-category-defaults nil
        completion-category-overrides '((lsp-mode (styles orderless)))))
