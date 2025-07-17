;;; init-javascript.el --- configure javascript language support  -*- lexical-binding:t -*-
;;; Commentary:
;;; Code:

(use-package js
  :init
  ;; set indent level to 2
  (setopt js-indent-level 2)

  :mode
  ;; use js-mode for json, jsonc and jshint
  ("\\.\\(jsonc?\\|jshintrc\\)\\'" . js-mode)

  :bind (:map js-mode-map
              ;; C-c f formats json
              ("C-c f" . json-pretty-print-buffer)))

(provide 'init-javascript)

;;; init-javascript.el ends here
