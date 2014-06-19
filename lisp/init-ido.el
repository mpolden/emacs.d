;; install packages
(require-package 'flx-ido)
(require-package 'ido-vertical-mode)
(require-package 'ido-ubiquitous)
(require-package 'find-file-in-repository)

;; load ido
(require 'ido)
(ido-mode 1)
(setq ido-enable-prefix nil
      ido-enable-flex-matching t
      ido-case-fold nil
      ido-auto-merge-work-directories-length -1
      ido-create-new-buffer 'always
      ido-use-filename-at-point nil
      ido-max-prospects 10)

;; load flx-ido
(require 'flx-ido)
(flx-ido-mode 1)
;; disable ido faces to see flx highlights.
(setq ido-use-faces nil)

;; vertical mode for ido
(require 'ido-vertical-mode)
(ido-vertical-mode 1)

;; load ido-ubiquitous (a better ido-everywhere)
(require 'ido-ubiquitous)
(ido-ubiquitous-mode 1)

;; find file in repository
(global-set-key (kbd "C-x f") 'find-file-in-repository)

(provide 'init-ido)
