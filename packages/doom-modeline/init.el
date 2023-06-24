;;; nerd icons
(use-package nerd-icons
  :ensure t
  :straight t
  )

;;;  doom modeline
(use-package doom-modeline
  :ensure t
  :straight t
  :hook (after-init . doom-modeline-mode))


(setq doom-modeline-support-imenu t
      doom-modeline-height 5
      doom-modeline-bar-width 3
      doom-modeline-hud nil
      doom-modeline-window-width-limit 85
      doom-modeline-project-detection 'auto
      doom-modeline-buffer-file-name-style 'auto
      doom-modeline-icon t
      doom-modeline-major-mode-icon t
      doom-modeline-major-mode-color-icon t
      doom-modeline-buffer-state-icon t
      doom-modeline-buffer-modification-icon t
      doom-modeline-time-icon t
      doom-modeline-unicode-fallback nil
      doom-modeline-buffer-name t
      doom-modeline-highlight-modified-buffer-name t
      doom-modeline-minor-modes nil
      doom-modeline-enable-word-count nil
      doom-modeline-continuous-word-count-modes '(markdown-mode gfm-mode org-mode)
      doom-modeline-buffer-encoding t
      doom-modeline-indent-info nil
      doom-modeline-checker-simple-format t
      doom-modeline-number-limit 99
      doom-modeline-vcs-max-length 1
      doom-modeline-workspace-name t
      doom-modeline-persp-name t
      doom-modeline-display-default-persp-name nil
      doom-modeline-persp-icon t
      doom-modeline-lsp t
      doom-modeline-modal t
      doom-modeline-modal-icon t
      doom-modeline-mu4e nil
      doom-modeline-gnus t
      doom-modeline-gnus-timer 2
      doom-modeline-gnus-excluded-groups '("dummy.group")
      doom-modeline-irc t
      doom-modeline-irc-stylize 'identity
      doom-modeline-battery t
      doom-modeline-time t
      doom-modeline-display-misc-in-all-mode-lines t
      doom-modeline-env-version t
      doom-modeline-env-enable-python t
      doom-modeline-env-enable-ruby t
      doom-modeline-env-enable-perl t
      doom-modeline-env-enable-go t
      doom-modeline-env-enable-elixir t
      doom-modeline-env-enable-rust t
      doom-modeline-env-load-string "..."
      doom-modeline-always-visible-segments '(mu4e irc)
      doom-modeline-before-update-env-hook nil
      doom-modeline-after-update-env-hook nil
)
(display-battery-mode t)
