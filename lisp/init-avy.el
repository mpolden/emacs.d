;;; init-avy.el --- configure avy  -*- lexical-binding:t -*-
;;; Commentary:
;;; Code:

(use-package avy
  :ensure t
  :bind
  ;; C-c j jumps to char using 2 initial chars
  (("C-c j". avy-goto-char-2)
   ;; M-g M-g uses avy-goto-line instead regular goto-line
   ("M-g M-g" . avy-goto-line)))

(provide 'init-avy)

;;; init-avy.el ends here
