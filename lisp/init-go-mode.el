;; install package
(require-package 'go-mode)

(require 'go-mode)

(defun go-mode-create-imenu-index ()
  "Create and return an imenu index alist. Unlike the default
alist created by go-mode, this method creates an alist where
items follow a style that is consistent with other prog-modes."
  (let* ((patterns `(("type" "^type *\\([^ \t\n\r\f]*\\)" 1)
                     ("func" ,go-func-regexp 1)))
         (index (imenu--generic-function patterns))
         (meth-index))
    (save-excursion
      (goto-char (point-min))
      (while (re-search-forward go-func-meth-regexp (point-max) t)
        (let* ((var (match-string-no-properties 1))
               (func (match-string-no-properties 2))
               (name (concat var func))
               (beg (match-beginning 0))
               (marker (copy-marker beg))
               (item (cons name marker)))
          (setq meth-index (cons item meth-index)))))
    (nconc index (list (cons "func" meth-index)))))

(defun go-mode-create-flat-imenu-index ()
  "Return a flat imenu index alist. See `go-mode-create-imenu-index'."
  (apply 'nconc (mapcar 'cdr (go-mode-create-imenu-index))))

(add-hook 'go-mode-hook
          (lambda ()
            ;; C-c p runs gofmt on the buffer
            (define-key go-mode-map (kbd "C-c p") 'gofmt)
            ;; use flat imenu index
            (setq-local imenu-create-index-function
                        #'go-mode-create-flat-imenu-index)))

(provide 'init-go-mode)
