(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("elpa" . "https://elpa.gnu.org/packages/"))


(package-initialize)
(unless  (package-installed-p 'use-package)
(package-refresh-contents)
(package-install 'use-package))
(require 'use-package)
(setq use-package-always-ensure t)
(setq package-enable-at-startup nil)



