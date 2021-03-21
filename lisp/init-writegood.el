;;; init-writegood.el --- configure weasel word detection  -*- lexical-binding:t -*-
;;; Commentary:
;;; Code:

(use-package writegood-mode
  :ensure t
  :hook
  ;; load writegood-mode automatically when flyspell is used
  (flyspell-mode . writegood-mode))

(provide 'init-writegood)

;;; init-writegood.el ends here
