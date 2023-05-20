;; Bootstrap `straight.el'
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

;; Enable `straight.el' by default
(straight-use-package 'use-package)

;; Configure package archives
(setq straight-use-package-by-default t
      package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))

;; Initialize packages
(straight-use-package 'use-package)
(setq use-package-always-ensure t)
(setq package-enable-at-startup nil)
(package-initialize)

;; Example usage of `use-package'
(use-package straight
  :straight t
  :config
  (setq straight-use-package-by-default t))

