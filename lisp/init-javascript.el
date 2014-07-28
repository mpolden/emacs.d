;; install package
(require-package 'js2-mode)

(require 'js2-mode)
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

;; set indent level to 2
(setq-default js2-basic-offset 2)
(setq-default js-indent-level 2)

;; highlight built-in functions, such as filter, forEach and map
(setq js2-highlight-level 3)

;; don't override M-j
(eval-after-load "js2-mode"
  '(define-key js2-mode-map (kbd "M-j") nil))

;; js2-mode can't handle json
(require 'js)
(add-to-list 'auto-mode-alist '("\\.\\(json\\|jshintrc\\)\\'" . js-mode))

(defun js2-imenu-create-flat-index (&optional alist prefix)
  "Return a flattened alist for `imenu--index-alist'."
  ;; adapted from python-imenu-create-flat-index in python.el
  (apply
   'nconc
   (mapcar
    (lambda (item)
      (let ((name (if prefix
                      (concat prefix "." (car item))
                    (car item)))
            (pos (cdr item)))
        (cond ((or (numberp pos) (markerp pos))
               (list (cons name pos)))
              ((listp pos)
               (js2-imenu-create-flat-index pos name)))))
    (or alist (js2-mode-create-imenu-index)))))

;; enable imenu extras
(require 'js2-imenu-extras)
(add-hook 'js2-mode-hook
          (lambda ()
            (js2-imenu-extras-mode 1)
            (setq-local imenu-create-index-function
                        #'js2-imenu-create-flat-index)))

;; use jq for reformatting json
(defun jq-reformat-region (begin end)
  (interactive "r")
  (if (executable-find "jq")
      (let* ((tmpfile (make-temp-file "jq"))
             (errbuf (get-buffer-create "*jq errors*"))
             (result (call-process-region begin end "jq" nil
                                          `((:file ,tmpfile) ,tmpfile) nil
                                          "--monochrome-output" "--ascii-output"
                                          "."))
             (success (zerop result))
             (resbuf (if success (current-buffer) errbuf)))
        (with-current-buffer resbuf
          (insert-file-contents tmpfile nil nil nil t))
        (if success
            (progn
              (kill-buffer errbuf)
              (message "Reformatted JSON"))
          (message "Failed to reformat JSON. Check errors for details"))
        (delete-file tmpfile))
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
