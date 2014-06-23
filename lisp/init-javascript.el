;; install packages
(require-package 'js2-mode)
(require-package 'json-mode)

;; load js2-mode
(require 'js2-mode)
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

;; load json-mode
(require 'json-mode)
(add-to-list 'auto-mode-alist '("\\.json\\'" . json-mode))

;; prefer jq for reformatting json
(defun jq-reformat-region (begin end)
  (interactive "r")
  (if (executable-find "jq")
      (shell-command-on-region
       begin end "jq --monochrome-output --ascii-output ." (current-buffer) t)
    (json-reformat-region begin end)))

(defun jq-reformat ()
  (interactive)
  (if (use-region-p)
      (jq-reformat-region (region-beginning) (region-end))
    (jq-reformat-region (point-min) (point-max))))

(add-hook 'json-mode-hook
          (lambda ()
            (define-key json-mode-map (kbd "C-c C-f") 'jq-reformat)))

(provide 'init-javascript)
