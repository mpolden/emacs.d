;;; init-javascript.el --- configure javascript language support  -*- lexical-binding:t -*-
;;; Commentary:
;;; Code:

(use-package js
  :init
  ;; set indent level to 2
  (setopt js-indent-level 2)

  :mode
  ;; use js-json-mode for json and jsonc
  ("\\.jsonc?\\'" . js-json-mode)

  :bind (:map js-json-mode-map
              ;; C-c f formats json
              ("C-c f" . json-pretty-print-buffer)))

(provide 'init-javascript)

;;; init-javascript.el ends here
