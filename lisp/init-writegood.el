(use-package writegood-mode
  :ensure t
  :hook
  ;; load writegood-mode automatically when flyspell is used
  (flyspell-mode . writegood-mode))

(provide 'init-writegood)
