;;; init-vterm.el --- configure vterm  -*- lexical-binding:t -*-
;;; Commentary:
;;; Code:

(defun mpolden/vterm-change-theme (theme)
  "Change the theme in all Vterm buffers to THEME."
  (mapcar (lambda (buf)
            (with-current-buffer buf
              (vterm-send-string (concat "export VTERM_THEME=" theme "\n"))))
          (seq-filter (lambda (buf) (string-prefix-p "vterm: " (buffer-name buf)))
                      (buffer-list))))

(defun mpolden/vterm-set-theme (theme)
  "Set the default Vterm theme to THEME."
  (let ((new-var (concat "VTERM_THEME=" theme)))
    (setq vterm-environment
          (seq-filter (lambda (var)
                        (unless (string-prefix-p "VTERM_THEME=" var)))
                      vterm-environment))
    (add-to-list 'vterm-environment new-var t)))

(use-package vterm
  :ensure t
  :init
  ;; include current directory in buffer name
  (setq vterm-buffer-name-string "vterm: %s")
  :config
  ;; set theme
  (when (fboundp 'mpolden/current-theme)
    (mpolden/vterm-set-theme (mpolden/current-theme))))

(provide 'init-vterm)

;;; init-vterm.el ends here
