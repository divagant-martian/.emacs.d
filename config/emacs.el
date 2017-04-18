;;; package --- emacs behaviours (not inside buffers)
;;; Commentary:
;;; Code:

;; splash screen, toolbar, menubar ---------------------------------------------
(setq inhibit-splash-screen t)
(tool-bar-mode -1)
(menu-bar-mode 0)
(global-set-key (kbd "<f10>") 'menu-bar-mode)

;; Cycle buffers ignoring spetial buffers --------------------------------------
(set-frame-parameter
 (selected-frame) 'buffer-predicate
 (lambda (buf) (not (string-match-p "^*" (buffer-name buf)))))

;; override for switching buffers
(global-set-key (kbd "M-<left>") 'next-buffer)
(global-set-key (kbd "M-<right>") 'previous-buffer)

;; avoid auto save and temp files ----------------------------------------------
(setq auto-save-default nil)
(setq make-backup-files nil)
(setq auto-save-list-file-prefix nil)

;; yes-or-no questions can be answered with y and n ----------------------------
(defalias 'yes-or-no-p 'y-or-n-p)

;; kill buffer kills its windows -----------------------------------------------
(defun kill-buffer-and-its-windows (buffer)
  "Kill BUFFER and delete its windows.  Default is `current-buffer'.
BUFFER may be either a buffer or its name (a string)."
  (interactive (list (read-buffer "Kill buffer: " (current-buffer) 'existing)))
  (setq buffer  (get-buffer buffer))
  (if (buffer-live-p buffer)            ; Kill live buffer only.
      (let ((wins  (get-buffer-window-list buffer nil t))) ; On all frames.
        (when (and (buffer-modified-p buffer)
                   (fboundp '1on1-flash-ding-minibuffer-frame))
          (1on1-flash-ding-minibuffer-frame t)) ; Defined in `oneonone.el'.
        (when (kill-buffer buffer)      ; Only delete windows if buffer killed.
          (dolist (win  wins)           ; (User might keep buffer if modified.)
            (when (window-live-p win)
              ;; Ignore error, in particular,
              ;; "Attempt to delete the sole visible or iconified frame".
              (condition-case nil (delete-window win) (error nil))))))
    (when (called-interactively-p 'interactive)
      (error "Cannot kill buffer.  Not a live buffer: `%s'" buffer))))
(substitute-key-definition 'kill-buffer 'kill-buffer-and-its-windows global-map)

;; Fewer questions at closing --------------------------------------------------
(defun my-kill-emacs ()
  "Save some buffers, then exit unconditionally."
  (interactive)
  (save-some-buffers nil t)
  (kill-emacs))
(global-set-key (kbd "C-x C-c") 'my-kill-emacs)

;;; emacs.el ends here
