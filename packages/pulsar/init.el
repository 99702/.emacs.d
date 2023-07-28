;;; https://gitlab.com/protesilaos/pulsar/
(use-package pulsar
  :straight t
  :ensure t)
(customize-set-variable
 'pulsar-pulse-functions ; Read the doc string for why not `setq'
 '(recenter-top-bottom
        move-to-window-line-top-bottom
        reposition-window
        bookmark-jump
        other-window
        delete-window
        delete-other-windows
        forward-page
        backward-page
        scroll-up-command
        scroll-down-command
        windmove-right
        windmove-left
        windmove-up
        windmove-down
        windmove-swap-states-right
        windmove-swap-states-left
        windmove-swap-states-up
        windmove-swap-states-down
        tab-new
        tab-close
        tab-next
        org-next-visible-heading
        org-previous-visible-heading
        org-forward-heading-same-level
        org-backward-heading-same-level
        outline-backward-same-level
        outline-forward-same-level
        outline-next-visible-heading
        outline-previous-visible-heading
	treemacs-select-window
	vterm-toggle
	treemacs-visit-node-horizontal-split
	treemacs-visit-node-vertical-split
        outline-up-heading))

(setq pulsar-pulse t)
(setq pulsar-delay 0.055)
(setq pulsar-iterations 20)
(setq pulsar-face 'pulsar-cyan)
;; (setq pulsar-highlight-face 'pulsar-yellow)
(add-hook 'next-error-hook #'pulsar-pulse-line-red)
(pulsar-global-mode 1)


;; integration with the `consult' package:
(add-hook 'consult-after-jump-hook #'pulsar-recenter-top)
(add-hook 'consult-after-jump-hook #'pulsar-reveal-entry)

;; integration with the built-in `imenu':
(add-hook 'imenu-after-jump-hook #'pulsar-recenter-top)
(add-hook 'imenu-after-jump-hook #'pulsar-reveal-entry)

;; integration with the built-in `xref':
(add-hook 'xref-after-jump-hook #'pulsar-recenter-top)
(add-hook 'xref-after-jump-hook #'pulsar-reveal-entry)

;; integration with the built-in `bookmark':
(add-hook 'bookmark-after-jump-hook #'pulsar-recenter-top)
(add-hook 'bookmark-after-jump-hook #'pulsar-reveal-entry)

(add-hook 'next-error-hook #'pulsar-pulse-line)
