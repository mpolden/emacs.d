(use-package dired
  :ensure nil ;; package is bundled with emacs
  :init
  ;; show human readable sizes in dired
  (setq dired-listing-switches "-alh")

  ;; show human readable free space
  (setq directory-free-space-args "-h")

  ;; group directories first in dired if supported
  (when (eq 0 (call-process insert-directory-program
                            nil nil nil "--group-directories-first"))
    (setq dired-listing-switches (concat dired-listing-switches
                                         " --group-directories-first")))
  :bind ("M-<up>" . dired-up-directory))

(provide 'init-dired)
