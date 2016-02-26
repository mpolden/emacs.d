;; add melpa repo
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)

;; install missing packages automatically
(setq use-package-always-ensure t)

;; install and load use-package
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

;; install diminish
(unless (package-installed-p 'diminish)
  (package-install 'diminish))

;; speed up loading of use-package and dependencies
(eval-when-compile
  (require 'use-package))
(require 'diminish)
(require 'bind-key)

(provide 'init-package)
