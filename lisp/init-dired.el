(use-package dired
  :ensure nil ;; package is bundled with emacs
  :init
  ;; show human readable sizes in dired
  (setq dired-listing-switches "-alh")

  ;; group directories first in dired if supported
  (when (eq 0 (call-process insert-directory-program
                            nil nil nil "--group-directories-first"))
    (setq dired-listing-switches (concat dired-listing-switches
                                         " --group-directories-first"))))

(provide 'init-dired)
