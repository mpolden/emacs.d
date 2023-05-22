;;; init-flyspell.el --- configure flyspell  -*- lexical-binding:t -*-
;;; Commentary:
;;; Code:

(use-package flyspell
  ;; load flyspell automatically for these modes
  :hook ((git-commit-mode . flyspell-mode)
         (gfm-mode . flyspell-mode)
         (org-mode . flyspell-mode)
         (latex-mode . flyspell-mode))

  :config
  ;; prefer hunspell
  (when (executable-find "hunspell")
    (setq ispell-program-name "hunspell")))

(use-package flyspell-correct
  :ensure t
  :bind (:map flyspell-mode-map
              ("C-c s" . flyspell-correct-wrapper)))

(provide 'init-flyspell)

;;; init-flyspell.el ends here
