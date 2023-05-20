;;; init-vertico.el --- a better completion ui  -*- lexical-binding:t -*-
;;; Commentary:
;;; Code:

;; save minibuffer history so that vertico can use it for sorting
(use-package savehist
  :config
  (savehist-mode 1))

;; enhanced search and navigation commands
(use-package consult
  :ensure t
  :bind (("C-x b" . consult-buffer)
         ("C-c i" . consult-imenu)
         ("C-c I" . consult-imenu-multi)))

;; completion style providing fuzzy matching
(use-package orderless
  :ensure t
  :init
  ;; https://github.com/minad/vertico/blob/c36ad0c9471010a0c160268cc6581edf4959e2d3/README.org#configuration
  (setq orderless-matching-styles '(orderless-flex)
        completion-styles '(orderless basic)
        completion-category-defaults nil
        completion-category-overrides '((file (styles partial-completion)))))

;; show rich annotations in the minibuffer
(use-package marginalia
  :ensure t
  :config
  (marginalia-mode 1))

;; a better completion ui
(use-package vertico
  :ensure t
  :config
  (vertico-mode 1))

;; make directory navigation behave like ido
;; https://github.com/minad/vertico/blob/c36ad0c9471010a0c160268cc6581edf4959e2d3/README.org#extensions
(use-package vertico-directory
  :ensure nil
  :after vertico
  :bind (:map vertico-map
              ("RET" . vertico-directory-enter)
              ("DEL" . vertico-directory-delete-char)
              ("M-DEL" . vertico-directory-delete-word))
  :hook (rfn-eshadow-update-overlay . vertico-directory-tidy))

(provide 'init-vertico)

;;; init-vertico.el ends here
