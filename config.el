;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; ============================================================
;; Identity
;; ============================================================
;; (setq user-full-name "Your Name"
;;       user-mail-address "you@example.com")

;; ============================================================
;; Fonts (migrated from fontaine presets)
;; ============================================================

;; ============================================================
;; Theme & UI
;; ============================================================
(setq doom-theme 'tango)
(setq display-line-numbers-type 'relative)

;; No backup/autosave/lockfiles
(setq make-backup-files nil
      auto-save-default nil
      create-lockfiles nil)

;; Windmove wrap around
(setq windmove-wrap-around t)

;; Indent settings
(setq-default indent-tabs-mode t)
(setq js-indent-level 2
      typescript-indent-level 2)

;; Show paren style

;; Focus follows mouse
(setq focus-follows-mouse t
      mouse-autoselect-window t)

;; Display time + battery in modeline
(display-time-mode 1)
(setq display-time-format "%H:%M %a %d %b"
      display-time-default-load-average nil)
(display-battery-mode 1)

;; GTK dark theme
(add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))

;; Org directory
(setq org-directory "~/org/")

;; ============================================================
;; Custom Functions (ported from vanilla config)
;; ============================================================

(defun set-selective-display-dlw (&optional level)
  "Fold text indented same or more than the cursor.
If level is set, set the indent level to LEVEL.
If 'selective-display' is already set to LEVEL, clicking
again will unset 'selective-display' by setting it to 0."
  (interactive "P")
  (if (eq selective-display (1+ (current-column)))
      (set-selective-display 0)
    (set-selective-display (or level (1+ (current-column))))))

(defun open-corresponding-angular-component ()
  "Open the related file based on the current buffer's file name.
Toggles between .ts and .html Angular files."
  (interactive)
  (let* ((file-name (buffer-file-name))
         (base-name (file-name-nondirectory file-name))
         (extension (file-name-extension file-name)))
    (if (string= extension "ts")
        (let ((related-file (concat (file-name-directory file-name)
                                    (file-name-sans-extension base-name)
                                    ".html")))
          (if (file-exists-p related-file)
              (find-file related-file)
            (message "No related HTML file found.")))
      (if (string= extension "html")
          (let ((related-file (concat (file-name-directory file-name)
                                      (file-name-sans-extension base-name)
                                      ".ts")))
            (if (file-exists-p related-file)
                (find-file related-file)
              (message "No related TS file found.")))
        (message "Unsupported file type.")))))

(defun generate-random-words (n)
  "Generate N non-repeated random words and insert at cursor."
  (interactive "nNumber of words to generate: ")
  (let* ((words '("apple" "banana" "cherry" "date" "elderberry" "fig" "grape"
                  "honeydew" "orange" "pear" "quince" "raspberry" "strawberry"
                  "tangerine" "watermelon"))
         (num-words (length words))
         (random-words (make-hash-table :test 'equal)))
    (dotimes (i n)
      (let ((random-word (nth (random num-words) words)))
        (while (gethash random-word random-words)
          (setq random-word (nth (random num-words) words)))
        (puthash random-word t random-words)
        (insert random-word)
        (when (< i (- n 1))
          (insert " "))))
    (insert "\n")))

(defun open-in-nautilus ()
  "Open current file's directory in Nautilus."
  (interactive)
  (let ((file (buffer-file-name)))
    (if file
        (if (file-directory-p file)
            (setq file (concat file "/")))
      (setq file default-directory))
    (start-process "nautilus" nil "nautilus" file)))

(defun open-in-terminal ()
  "Open current directory in gnome-terminal."
  (interactive)
  (let ((file (buffer-file-name)))
    (if file
        (if (file-directory-p file)
            (setq file (concat file "/")))
      (setq file default-directory))
    (start-process "gnome-terminal" nil "gnome-terminal" file)))

(defun hide-modeline-in-vterm ()
  "Hide the modeline in vterm buffers."
  (setq-local mode-line-format nil))

;; ============================================================
;; Package Configs
;; ============================================================

;; --- Evil extras ---

;; --- Pulsar (pulse highlight) ---
(use-package! pulsar
  :config
  (setq pulsar-face 'pulsar-red
        pulsar-delay 0.055
        pulsar-iterations 20)
  (pulsar-global-mode 1)
  (add-hook 'consult-after-jump-hook #'pulsar-recenter-middle)
  (add-hook 'consult-after-jump-hook #'pulsar-reveal-entry)
  (add-hook 'imenu-after-jump-hook #'pulsar-recenter-middle)
  (add-hook 'imenu-after-jump-hook #'pulsar-reveal-entry))

;; --- Fontaine (font presets) ---
(use-package! fontaine
  :config
  (setq fontaine-presets
        '((tiny      :default-height 70)
          (small     :default-height 90)
          (regular   :default-height 100)
          (medium    :default-height 110)
          (large     :default-height 140)
          (presentation :default-height 170)
          (jumbo     :default-height 220)
          )))


;; --- Expand Region ---

;; --- Vterm Toggle ---
(after! vterm
  (setq vterm-toggle-fullscreen-p nil)
  (add-hook 'vterm-mode-hook #'hide-modeline-in-vterm))

(use-package! vterm-toggle
  :after vterm
  :config
  (setq vterm-toggle-fullscreen-p nil)
  (add-to-list 'display-buffer-alist
               '((lambda (buffer-or-name _)
                   (let ((buffer (get-buffer buffer-or-name)))
                     (with-current-buffer buffer
                       (or (equal major-mode 'vterm-mode)
                           (string-prefix-p vterm-buffer-name (buffer-name buffer))))))
                 (display-buffer-reuse-window display-buffer-at-bottom)
                 (reuse-window-purpose . visible)
                 (window-height . 0.2))))

;; --- Org Fancy Priorities ---
(after! org
  (use-package! org-fancy-priorities
    :hook (org-mode . org-fancy-priorities-mode)
    :config
    (setq org-fancy-priorities-list '("⚡" "⬆" "⬇" "☕"))))

;; --- Org Mode Setup ---
(after! org
  (setq org-ellipsis " ▾")
  (add-hook 'org-mode-hook #'variable-pitch-mode)
  (add-hook 'org-mode-hook #'visual-line-mode)
  ;; Heading font sizes
  (custom-set-faces!
    '(org-level-1 :inherit outline-1 :font "Cantarell" :weight regular :height 1.2)
    '(org-level-2 :inherit outline-2 :font "Cantarell" :weight regular :height 1.1)
    '(org-level-3 :inherit outline-3 :font "Cantarell" :weight regular :height 1.05)
    '(org-level-4 :inherit outline-4 :font "Cantarell" :weight regular :height 1.0))
  ;; Fixed-pitch in org
  (custom-set-faces!
    '(org-block :inherit fixed-pitch)
    '(org-code :inherit (shadow fixed-pitch))
    '(org-table :inherit (shadow fixed-pitch))
    '(org-verbatim :inherit (shadow fixed-pitch))
    '(org-special-keyword :inherit (font-lock-comment-face fixed-pitch))
    '(org-meta-line :inherit (font-lock-comment-face fixed-pitch))
    '(org-checkbox :inherit fixed-pitch)))

;; --- Treemacs ---
(after! treemacs
  (setq treemacs-width 20
        treemacs-indentation 2
        treemacs-git-mode 'deferred)
  (treemacs-follow-mode 1))

;; --- LSP ---
(after! lsp-mode
  (setq lsp-headerline-breadcrumb-enable nil
        lsp-log-io nil))


;; --- TMR ---
(use-package! tmr)


;; --- Leader key bindings (SPC) ---
(map! :leader
      ;; General
      :desc "Save file"              "s"     #'save-buffer
      :desc "Comment line"           ";"     #'comment-line
      :desc "Comment dwim"           ":"     #'comment-dwim
      :desc "Toggle read-only"       "q"     #'read-only-mode
      :desc "Jump to matching item"  "n"     #'evil-jump-item

      ;; Window navigation (SPC h/j/k/l)
      :desc "Window left"            "h"     #'windmove-left
      :desc "Window right"           "l"     #'windmove-right
      :desc "Window down"            "j"     #'windmove-down
      :desc "Window up"              "k"     #'windmove-up

      ;; Window management (SPC 0/1/2/3)
      :desc "Close window"           "0"     #'delete-window
      :desc "Close other windows"    "1"     #'delete-other-windows
      :desc "Horizontal split"       "2"     #'split-window-below
      :desc "Vertical split"         "3"     #'split-window-right

      ;; Buffer / Window prefix (SPC w)
      (:prefix ("w" . "window/buffer")
       :desc "Switch buffer"         "s"     #'switch-to-buffer
       :desc "Consult buffer"        "b"     #'consult-buffer
       :desc "Toggle fullscreen"     "f"     #'toggle-frame-fullscreen
       :desc "Toggle tab bar"        "t"     #'toggle-frame-tab-bar
       :desc "Kill buffer"           "k"     #'kill-buffer)

      ;; Tab bar (SPC t)
      (:prefix ("t" . "tab")
       :desc "Close other tabs"      "1"     #'tab-bar-close-other-tabs
       :desc "New tab"               "2"     #'tab-new
       :desc "Close tab"             "0"     #'tab-close
       :desc "Duplicate tab"         "n"     #'tab-duplicate
       :desc "Undo tab close"        "u"     #'tab-undo
       :desc "Rename tab"            "r"     #'tab-rename
       :desc "Previous tab"          "h"     #'tab-previous
       :desc "Next tab"              "l"     #'tab-next)

      ;; Toggles / Open
      (:prefix ("m" . "misc")
       :desc "Toggle vterm"          "v"     #'vterm-toggle
       :desc "Vterm in project"      "p"     #'projectile-run-vterm-other-window
       :desc "Macroexpand once"      "e"     #'cider-macroexpand-1
       :desc "Macroexpand all"       "E"     #'cider-macroexpand-all)

      ;; Font
      (:prefix ("c" . "code")
       :desc "Change font preset"    "f"     #'fontaine-set-preset)

      ;; Treemacs focus
      :desc "Focus treemacs"         "."     #'treemacs-select-window

      ;; Project
      :desc "Projectile prefix"      "p"     #'projectile-command-map
      :desc "Find file / Angular"    "SPC"   #'projectile-find-file)

;; --- LSP navigation (normal mode) ---
(map! :after lsp-mode
      :map lsp-mode-map
      :n "gr" #'lsp-find-references
      :n "gd" #'lsp-find-definition
      :n "gi" #'lsp-goto-implementation)

;; --- Global (non-Evil) bindings ---
(map! "C-z"   #'set-selective-display-dlw
      "C-="   #'er/expand-region
      "C-s"   #'consult-line
      "<f5>"  #'consult-theme
      "M-A"   #'marginalia-cycle
      "M-y"   #'consult-yank-pop)

;; --- Vterm toggle global ---
(map! "C-x t v" #'vterm-toggle)

;; --- Consult navigation (M-g prefix) ---
(map! "M-g e"   #'consult-compile-error
      "M-g f"   #'consult-flymake
      "M-g g"   #'consult-goto-line
      "M-g M-g" #'consult-goto-line
      "M-g o"   #'consult-outline
      "M-g m"   #'consult-mark
      "M-g k"   #'consult-global-mark)

;; --- Consult search (M-s prefix) ---
(map! "M-s d"   #'consult-find
      "M-s g"   #'consult-grep
      "M-s L"   #'consult-line-multi)

;; --- Consult buffer (C-x prefix) ---
(map! "C-x b"   #'consult-buffer
      "C-x 4 b" #'consult-buffer-other-window
      "C-x 5 b" #'consult-buffer-other-frame
      "C-x r b" #'consult-bookmark
      "C-x p b" #'consult-project-buffer)


;; --- Paredit-style bindings via smartparens (Doom's default) ---
(map! :after smartparens
      :map smartparens-mode-map
      "C->"     #'sp-forward-slurp-sexp
      "C-<"     #'sp-forward-barf-sexp
      "C-M->"   #'sp-backward-slurp-sexp
      "C-M-<"   #'sp-backward-barf-sexp
      "M-r"     #'sp-raise-sexp
      "M-s"     #'sp-splice-sexp)
