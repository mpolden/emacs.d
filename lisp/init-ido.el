;; install packages
(require-package 'flx-ido)
(require-package 'ido-vertical-mode)
(require-package 'find-file-in-repository)

;; load ido
(require 'ido)
(ido-mode t)
(setq ido-enable-prefix nil
      ido-enable-flex-matching t
      ido-case-fold nil
      ido-auto-merge-work-directories-length -1
      ido-create-new-buffer 'always
      ido-use-filename-at-point nil
      ido-max-prospects 10
      ido-everywhere t)

;; load flx-ido
(require 'flx-ido)
(flx-ido-mode 1)
;; disable ido faces to see flx highlights.
(setq ido-use-faces nil)

;; vertical mode for ido
(require 'ido-vertical-mode)
(ido-vertical-mode)

;; find file in project
(global-set-key (kbd "M-p") 'find-file-in-repository)

(provide 'init-ido)
