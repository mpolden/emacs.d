;; install package
(require-package 'js2-mode)

(require 'js2-mode)
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

;; js2-mode can't handle json
(require 'js)
(add-to-list 'auto-mode-alist '("\\.json\\'" . js-mode))

;; use jq for reformatting json
(defun jq-reformat-region (begin end)
  (interactive "r")
  (if (executable-find "jq")
      (shell-command-on-region
       begin end "jq --monochrome-output --ascii-output ." (current-buffer) t)
    (message "Could not find jq in PATH.")))

(defun jq-reformat ()
  (interactive)
  (if (use-region-p)
      (jq-reformat-region (region-beginning) (region-end))
    (jq-reformat-region (point-min) (point-max))))

(add-hook 'js-mode-hook
          (lambda ()
            (define-key js-mode-map (kbd "C-c p") 'jq-reformat)))

(provide 'init-javascript)
