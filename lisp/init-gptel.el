;;; init-gptel.el --- llm client  -*- lexical-binding:t -*-
;;; Commentary:
;;; Code:

(defun mpolden/gptel-mode-buffer-local-variables ()
  "Set buffer-local variables for `gptel-mode'."
  (setq-local default-directory
              (expand-file-name "chat" org-directory))
  (set-visited-file-name (concat (file-name-sans-extension
                                  (expand-file-name (buffer-name)))
                                 ".org"))
  (visual-line-mode 1))

(defun mpolden/gptel-mode-in-chat-directory-p ()
  "Return non-nil if buffer is visiting a file in the chat directory."
  (when-let* ((buffer-file-name)
              (chat-dir (expand-file-name "chat" org-directory)))
    (file-in-directory-p buffer-file-name chat-dir)))

(defun mpolden/gptel-mode ()
  "Enable `gptel-mode' automatically if file is stored in chat directory."
  (when (mpolden/gptel-mode-in-chat-directory-p)
    (gptel-mode 1)
    ;; gptel-mode marks buffer as modified, but doesn't actually modify anything
    (set-buffer-modified-p nil)))

(defun mpolden/gptel-mode-after-response (start end)
  "Save chat buffer and move to next org heading.

START and END indicates the starting and ending position of the LLM response."
  (when (mpolden/gptel-mode-in-chat-directory-p)
    (save-buffer))
  (call-interactively 'gptel-end-of-response))

(use-package gptel
  :ensure t
  :after org
  :bind (("C-c h" . gptel))
  :init
  ;; use org-mode syntax
  (setq gptel-default-mode 'org-mode)
  ;; disable reasoning
  (setq gptel-include-reasoning nil)
  :hook
  ((gptel-mode . mpolden/gptel-mode-buffer-local-variables)
   ;; save chat buffer after response
   (gptel-post-response . mpolden/gptel-mode-after-response)
   (org-mode . mpolden/gptel-mode)))

(provide 'init-gptel)

;;; init-gptel.el ends here
