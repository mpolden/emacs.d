(use-package writegood-mode
  :hook
  ;; load writegood-mode automatically when flyspell is used
  (flyspell-mode . writegood-mode))

(provide 'init-writegood-mode)
