;; (add-hook 'typescript-ts-mode 'eglot-ensure)
;; (add-hook 'javascript-mode 'eglot-ensure)
;; (add-hook 'typescript-mode 'eglot-ensure)
;; (add-hook 'html-ts-mode 'eglot-ensure)
;; (add-hook 'typescript-ts-mode 'eglot-ensure)
;; (add-hook 'html-mode 'eglot-ensure)
;; (add-hook 'js-ts-mode 'eglot-ensure)
;; (add-hook 'tsx-ts-mode 'eglot-ensure)
;; (add-hook 'js-mode 'eglot-ensure)


;; corfu , cape , kind-icon orderless setup start

;; (use-package corfu
;;   :straight t
;;   ;; Optional customizations
;;   :custom
;;   (corfu-cycle t)                ;; Enable cycling for `corfu-next/previous'
;;   (corfu-auto t)                 ;; Enable auto completion
;;   ;; (corfu-auto-prefix 1)
;;   ;; (corfu-auto-delay 0.0)
;;   ;; (completion-styles '(orderless-fast))
;;   ;; (corfu-separator ?\s)          ;; Orderless field separator
;;   ;; (corfu-quit-at-boundary 'separator)   ;; Never quit at completion boundary
;;   ;; (corfu-quit-no-match 'separator)      ;; Never quit, even if there is no match
;;   ;; (corfu-preview-current nil)    ;; Disable current candidate preview
;;   (corfu-preselect 'prompt)      ;; Preselect the prompt
;;   ;; (corfu-on-exact-match nil)     ;; Configure handling of exact matches
;;   ;; (corfu-scroll-margin 5)        ;; Use scroll margin

;;   ;; Enable Corfu only for certain modes.
;;   ;; :hook ((prog-mode . corfu-mode)
;;   ;;        (shell-mode . corfu-mode)
;;   ;;        (eshell-mode . corfu-mode))

;;   :bind
;;   (:map corfu-map
;;         ("TAB" . corfu-next)
;;         ([tab] . corfu-next)
;;         ("S-TAB" . corfu-previous)
;;         ([backtab] . corfu-previous))

;;   :init
;;   (global-corfu-mode)
;;   ;; (corfu-history-mode)
;;   )

;; (use-package kind-icon
;;   :straight t
;;   :ensure t
;;   :after corfu
;;   :custom
;;   (kind-icon-default-face 'corfu-default) ; to compute blended backgrounds correctly
;;   :config
;;   (add-to-list 'corfu-margin-formatters #'kind-icon-margin-formatter))

;; (use-package cape

;;   :straight t

;;   :init
;;   ;; Add `completion-at-point-functions', used by `completion-at-point'.
;;   (add-to-list 'completion-at-point-functions #'cape-dabbrev)
;;   (add-to-list 'completion-at-point-functions #'cape-file)
;;   ;;(add-to-list 'completion-at-point-functions #'cape-history)
;;   ;;(add-to-list 'completion-at-point-functions #'cape-keyword)
;;   ;;(add-to-list 'completion-at-point-functions #'cape-tex)
;;   ;;(add-to-list 'completion-at-point-functions #'cape-sgml)
;;   ;;(add-to-list 'completion-at-point-functions #'cape-rfc1345)
;;   ;;(add-to-list 'completion-at-point-functions #'cape-abbrev)
;;   ;;(add-to-list 'completion-at-point-functions #'cape-ispell)
;;   ;;(add-to-list 'completion-at-point-functions #'cape-dict)
;;   ;;(add-to-list 'completion-at-point-functions #'cape-symbol)
;;   ;;(add-to-list 'completion-at-point-functions #'cape-line)
;; )

;; ;; corfu setup end 















;; ;;;;;;;;;;;;;;;; clojure mode
;; (use-package clojure-mode
;;   :straight t
;;   )
;; ;; (use-package rainbow-delimiters-mode)
;; (use-package clojure-mode-extra-font-locking
;;   :straight t
;;   )
;; ;; (use-package aggressive-indent)
;; ;; (use-package smartparens)
;; (use-package cider
;;   :straight t
;;   )

;; (add-hook 'clojure-mode-hook #'subword-mode)
;; (add-hook 'clojure-mode-hook #'smartparens-strict-mode)
;; ;; (add-hook 'clojure-mode-hook #'rainbow-delimiters-mode)
;; (add-hook 'clojure-mode-hook #'aggressive-indent-mode)

;; (use-package eglot-java)
;; (add-hook 'java-mode-hook 'eglot-java-mode)
;; (add-hook 'eglot-java-mode-hook (lambda ()                                        
;;   (define-key eglot-java-mode-map (kbd "C-c l n") #'eglot-java-file-new)
;;   (define-key eglot-java-mode-map (kbd "C-c l x") #'eglot-java-run-main)
;;   (define-key eglot-java-mode-map (kbd "C-c l t") #'eglot-java-run-test)
;;   (define-key eglot-java-mode-map (kbd "C-c l N") #'eglot-java-project-new)
;;   (define-key eglot-java-mode-map (kbd "C-c l T") #'eglot-java-project-build-task)
;;   (define-key eglot-java-mode-map (kbd "C-c l R") #'eglot-java-project-build-refresh)))
;; ;; (setq eglot-server-programs
;; ;;       '((java-mode . ("java" "-jar" "/home/kali/.emacs.d/java/eclipse.jdt.ls"))))

;; ;; (defvar +eglot/initialization-options-map (make-hash-table :size 5))

;; ;; (cl-defmethod eglot-initialization-options ((server eglot-lsp-server))
;; ;;     (if-let ((init-options (gethash (eglot--major-mode server) +eglot/initialization-options-map)))
;; ;;         init-options
;; ;;       eglot--{}))

;; ;; (add-to-list 'eglot-server-programs
;; ;;                `(java-mode "jdtls"
;; ;;                            "-configuration" ,(expand-file-name "cache/language-server/java/jdtls/config_linux" user-emacs-directory)
;; ;;                            "-data" ,(expand-file-name "cache/java-workspace" user-emacs-directory)
;; ;;                            ,(concat "--jvm-arg=-javaagent:" (expand-file-name "~/.m2/repository/org/projectlombok/lombok/1.18.20/lombok-1.18.20.jar"))))

;; ;; (puthash 'java-mode
;; ;;            `(:settings
;; ;;              (:java
;; ;;               (:configuration
;; ;;                (:runtime [(:name "JavaSE-1.8" :path "/usr/local/jdk-8")
;; ;;                           (:name "JavaSE-11" :path "/usr/local/graalvm-ce-java11-22.0.0.2")
;; ;;                           (:name "JavaSE-17" :path "/usr/local/graalvm-ce-java17-22.0.0.2" :default t)])
;; ;;                :format (:settings (:url ,(expand-file-name (locate-user-emacs-file "cache/eclipse-java-google-style.xml"))
;; ;;                                         :profile "GoogleStyle"))
;; ;;                ;; NOTE: https://github.com/redhat-developer/vscode-java/issues/406#issuecomment-356303715
;; ;;                ;; > We enabled it by default so that workspace-wide errors can be reported (eg. removing a public method in one class would cause compilation errors in other files consuming that method).
;; ;;                ;; for large workspaces, it may make sense to be able to disable autobuild if it negatively impacts performance.
;; ;;                :autobuild (:enabled t)
;; ;;                ;; https://github.com/dgileadi/vscode-java-decompiler
;; ;;                :contentProvider (:preferred "fernflower")))
;; ;;              ;; WIP: support non standard LSP `java/classFileContents', `Location' items that have a `jdt://...' uri
;; ;;              ;; https://github.com/eclipse/eclipse.jdt.ls/issues/1384
;; ;;              ;; nvim impl demo: https://github.com/mfussenegger/dotfiles/commit/3cddf73cd43120da2655e2df6d79bdfd06697f0e
;; ;;              ;; lsp-java impl demo: https://github.com/emacs-lsp/lsp-java/blob/master/lsp-java.el
;; ;;              :extendedClientCapabilities (:classFileContentsSupport t)
;; ;;              ;; bundles: decompilers, etc.
;; ;;              ;; https://github.com/dgileadi/dg.jdt.ls.decompiler
;; ;;              :bundles ,(let ((bundles-dir (expand-file-name (locate-user-emacs-file "cache/language-server/java/bundles" user-emacs-directory)))
;; ;;                              jdtls-bundles)
;; ;;                          (->> (when (file-directory-p bundles-dir)
;; ;;                                 (directory-files bundles-dir t "\\.jar$"))
;; ;;                               (append jdtls-bundles)
;; ;;                               (apply #'vector))))
;; ;;            +eglot/initialization-options-map)




;;;;;;;;;;;;;;;;;;;;;;;;;;;; lsp-mode ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package lsp-mode
  :ensure t
  :commands lsp
  :hook ((typescript-mode js-mode web-mode typescript-ts-mode javascript-mode js-mode mhtml-mode) . lsp)
  :init (setq lsp-prefer-flymake nil))
(setq lsp-headerline-breadcrumb-enable nil)

;; optionally
(use-package lsp-ui 
  :straight t
  :commands lsp-ui-mode)
;; if you are ivy user
(use-package lsp-ivy 
  :straight t
  :commands lsp-ivy-workspace-symbol)
(use-package lsp-treemacs 
  :straight t
  :commands lsp-treemacs-errors-list)

;; optionally if you want to use debugger
(setq gc-cons-threshold 100000000)
(setq lsp-log-io nil) ; if set to true can cause a performance hit


;; prettier js (apheleia)
(use-package prettier-js
  :straight t)
(use-package company
  :ensure t
  :config
  (setq company-minimum-prefix-length 1
        company-idle-delay 0.0) ; default is 0.2
  (global-company-mode t))

;; (use-package company-lsp
;;   :ensure t
;;   :commands company-lsp
;;   :config
;;   (push 'company-lsp company-backends))

;; (use-package yasnippet
;;   :ensure t
;;   :hook (prog-mode . yas-minor-mode))
;; (featurep 'yasnippet)
;; (setq lsp-enable-completion-at-point t)
;; (add-hook 'after-init-hook 'global-company-mode)




;; tide configuration
(use-package tide :straight t)
(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)
  (company-mode +1))
(setq company-tooltip-align-annotations t)
(add-hook 'typescript-mode-hook #'setup-tide-mode)
(add-hook 'typescript-ts-mode-hook #'setup-tide-mode)
