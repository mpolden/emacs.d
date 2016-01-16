;; install package
(require-package 'go-mode)

(require 'go-mode)

(defun go-mode-create-imenu-index ()
  "Create and return an imenu index alist. Unlike the default
alist created by go-mode, this method creates an alist where
items follow a style that is consistent with other prog-modes."
  (let* ((patterns '(("type" "^type *\\([^ \t\n\r\f]*\\)" 1)))
         (type-index (imenu--generic-function patterns))
         (func-index))
    (save-excursion
      (goto-char (point-min))
      (while (re-search-forward go-func-meth-regexp (point-max) t)
        (let* ((var (match-string-no-properties 1))
               (func (match-string-no-properties 2))
               (name (if var
                         (concat (substring var 0 -1) "." func)
                       func))
               (beg (match-beginning 0))
               (marker (copy-marker beg))
               (item (cons name marker)))
          (setq func-index (cons item func-index)))))
    (nconc type-index (list (cons "func" func-index)))))

(defun go-mode-create-flat-imenu-index ()
  "Return a flat imenu index alist. See `go-mode-create-imenu-index'."
  (apply 'nconc (mapcar 'cdr (go-mode-create-imenu-index))))

(add-hook 'go-mode-hook
          (lambda ()
            ;; C-c p runs gofmt on the buffer
            (define-key go-mode-map (kbd "C-c p") 'gofmt)
            ;; adjust fill-column
            (setq-local fill-column 120)
            ;; use flat imenu index
            (setq-local imenu-create-index-function
                        #'go-mode-create-flat-imenu-index)))

;; run gofmt before saving file
(add-hook 'before-save-hook 'gofmt-before-save)

;; configure company-mode
;; requires https://github.com/nsf/gocode for the backend
(when (and (featurep 'company) (featurep 'company-go))
  (add-hook 'go-mode-hook (lambda ()
                            (setq-local company-backends '(company-go))
                            (company-mode))))

;; use goimports if available
(when (executable-find "goimports")
  (setq gofmt-command "goimports"))

(provide 'init-go-mode)
