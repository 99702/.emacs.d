(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook))

;;(setq initial-buffer-choice (lambda () (get-buffer "*dashboard*")))
(setq dashboard-startup-banner "/home/kali/.emacs.d/logo/default.png")
(setq dashboard-center-content t)
(setq dashboard-set-footer nil)
(setq dashboard-items '((projects . 30)
			(recents  . 5)
                        ;; (bookmarks . 3)
                        ))
