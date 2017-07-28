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

(use-package go-mode
  :init
  ;; use goimports if available
  (when (executable-find "goimports")
    (setq gofmt-command "goimports"))

  :bind (:map go-mode-map
         ;; C-c p runs gofmt on the buffer
         ("C-c p" . gofmt))

  :config
  ;; run gofmt before saving file
  (add-hook 'before-save-hook 'gofmt-before-save)
  (add-hook 'go-mode-hook
            (lambda ()
              ;; adjust fill-column
              (setq-local fill-column 120)
              ;; use flat imenu index
              (setq-local imenu-create-index-function
                          #'go-mode-create-flat-imenu-index)))

  ;; install go-rename if gorename is found in PATH
  (use-package go-rename
    :if (executable-find "gorename")
    :bind (:map go-mode-map
                ("C-c r" . go-rename))))

(provide 'init-go-mode)
