(use-package flyspell
  ;; load flyspell automatically for these modes
  :hook ((git-commit-mode . flyspell-mode)
         (gfm-mode . flyspell-mode)
         (org-mode . flyspell-mode)
         (latex-mode . flyspell-mode))

  :bind (:map flyspell-mode-map
              ("C-c s" . flyspell-correct-word-before-point))

  :config
  ;; prefer hunspell
  (when (executable-find "hunspell")
    (setq ispell-program-name "hunspell")))

(provide 'init-flyspell)
