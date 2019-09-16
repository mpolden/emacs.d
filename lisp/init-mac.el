;; use fira code font if available
;; https://github.com/tonsky/FiraCode
(let ((font-family "Fira Code"))
  (when (and (display-graphic-p) (member font-family (font-family-list)))
    (set-face-attribute 'default nil :family font-family)
    (set-face-attribute 'default nil :height 150)

    ;; fira code retina at 14 pt may result in (window-total-height) being
    ;; exactly 80 which makes sensible splitting less sensible
    ;;
    ;; increment split-height-threshold so that vertical splits are still
    ;; preferred in most cases
    (setq split-height-threshold (+ 10 split-height-threshold))))

;; configure modifiers
(setq mac-option-modifier 'super)
(setq mac-command-modifier 'meta)
(setq ns-function-modifier 'hyper)

;; Norwegian mac-keyboard
(define-key key-translation-map (kbd "s-8") (kbd "["))
(define-key key-translation-map (kbd "s-(") (kbd "{"))
(define-key key-translation-map (kbd "s-9") (kbd "]"))
(define-key key-translation-map (kbd "s-)") (kbd "}"))
(define-key key-translation-map (kbd "s-7") (kbd "|"))
(define-key key-translation-map (kbd "s-/") (kbd "\\"))
(define-key key-translation-map (kbd "M-s-7") (kbd "M-|"))

;; don't open files from the workspace in a new frame
(setq ns-pop-up-frames nil)

;; use old-style fullscreen
(setq ns-use-native-fullscreen nil)

;; move deleted files to ~/.Trash
(setq trash-directory "~/.Trash")

;; use paths from shell
(use-package exec-path-from-shell
  :init (setq exec-path-from-shell-variables '("PATH" "MANPATH" "GOPATH"))
  :config (exec-path-from-shell-initialize))

;; add binding for toggling fullscreen
(global-set-key (kbd "M-RET") 'toggle-frame-fullscreen)

;; use gls if available (which supports --dired option)
(when (executable-find "gls")
  (setq insert-directory-program "gls"))

;; use gdf if available as it provides more correct output. When apfs is used,
;; the ifree column of bsd df seems to be incorrect
(when (executable-find "gdf")
  (setq directory-free-space-program "gdf"))

(provide 'init-mac)
