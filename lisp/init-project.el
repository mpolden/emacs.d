;;; init-project.el --- configure project integration  -*- lexical-binding:t -*-
;;; Commentary:
;;; Code:

(defun mpolden/project-try-go (dir)
  "Find root directory of a nested modules-based Go project from DIR."
  ;; this speeds up working with a go project nested inside a large repository
  (let* ((module-root (locate-dominating-file dir "go.mod"))
         (is-vc-root (file-directory-p (expand-file-name ".git" module-root))))
    (when (and module-root (not is-vc-root))
      (cons 'transient module-root))))

(defun mpolden/project-vterm ()
  "Start Vterm in the current project's root directory.
If a buffer already exists for any directory in the current
project, switch to it.

With \\[universal-argument] prefix arg, always create a new
buffer even if one already exists."
  (interactive)
  (let* ((default-directory (project-root (project-current t)))
         ;; find a vterm buffer which has its current directory in the project
         ;; root or any sub-directory of the root
         (vterm-buf
          (car (seq-filter
                (lambda (buf)
                  (let* ((buf-prefix "vterm: ")
                         (buf-name (buffer-name buf))
                         (buf-dir (string-remove-prefix buf-prefix buf-name)))
                    (and (string-prefix-p buf-prefix buf-name)
                         (file-in-directory-p buf-dir default-directory))))
                (buffer-list)))))
    (if (and vterm-buf (not current-prefix-arg))
        (pop-to-buffer vterm-buf)
      (vterm-other-window))))

(use-package project
  :init
  ;; commands to show when switching projects
  (setq project-switch-commands '((project-find-file "Find file" ?f)
                                  (project-dired "Dired" ?d)
                                  (mpolden/grep "Grep" ?g)
                                  (magit-project-status "Magit" ?m)
                                  (mpolden/project-vterm "Vterm" ?v)))
  ;; configure how projects are detected
  (setq project-find-functions '(mpolden/project-try-go project-try-vc))
  :bind (;; C-x f finds file in project
         ("C-x f" . project-find-file)
         ;; C-c p switches project
         ("C-c p" . project-switch-project)
         ;; C-c v starts vterm in project
         ("C-c v" . mpolden/project-vterm)))

(provide 'init-project)

;;; init-project.el ends here
