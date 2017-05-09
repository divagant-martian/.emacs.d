;;; package --- behaviour inside buffers
;;; Commentary:
;;; Code:

;; All about parentheses -------------------------------------------------------

;; auto open/closing parentheses
(setq-default skeleton-pair t)
(global-set-key "(" 'skeleton-pair-insert-maybe)
(global-set-key "[" 'skeleton-pair-insert-maybe)
(global-set-key "{" 'skeleton-pair-insert-maybe)
(global-set-key "\"" 'skeleton-pair-insert-maybe)
(global-set-key "'" 'skeleton-pair-insert-maybe)

;; show pairs () {}
(setq-default show-paren-delay 0)
(show-paren-mode 1)

;; Some editing configs --------------------------------------------------------

;; override for undo
(global-set-key (kbd "C-z") 'undo)

;; Smart comments
(require 'smart-comment)
(global-set-key (kbd "<f2>") 'smart-comment)

;; move lines up and down
(require 'shift-text)
(global-set-key (kbd "M-<up>") 'shift-text-up)
(global-set-key (kbd "M-<down>") 'shift-text-down)

;; allow multiple cursors
(require 'multiple-cursors)
(global-unset-key (kbd "M-<down-mouse-1>"))
(global-set-key (kbd "M-<mouse-1>") 'mc/add-cursor-on-click)
(global-set-key (kbd "M-m") 'mc/mark-all-like-this)

;; clean buffer
(global-set-key (kbd "C-x DEL") 'erase-buffer)

;; selected text gets replaced
(delete-selection-mode 1)

;; change between CamelCase and snake_case
(require 'string-inflection)
(global-set-key (kbd "M-c") 'string-inflection-lower-camelcase)
(global-set-key (kbd "M-s") 'string-inflection-underscore)

;; folding functionality
(require 'origami)
(add-to-list 'origami-parser-alist '(rust-mode . origami-c-style-parser))
(define-key origami-mode-map (kbd "M-f") 'origami-toggle-node)
(global-origami-mode 1)

;; All about tabs and spaces ---------------------------------------------------

;; spaces instead of tabs
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

;; insert tab with backtab
(global-set-key
 (kbd "<backtab>")
 (lambda() (interactive)(insert "\t")))

;; activate whitespace mode
(global-set-key (kbd "<f4>") 'whitespace-mode)
(global-set-key (kbd "<f5>") 'whitespace-cleanup)

;; delete all whitespaces if deleting one
(require 'hungry-delete)
(global-hungry-delete-mode)

;; when whitespace is active, leaves exactly one space wherever it is typed
(add-hook 'whitespace-mode-hook
          (lambda () (local-set-key (kbd "SPC") 'just-one-space)))

;; (add-hook 'before-save-hook 'whitespace-cleanup)

;; Correctly indent between braces ---------------------------------------------
(defun av/auto-indent-method ()
  "Automatically indent a method by adding two newlines.
Puts point in the middle line as well as indent it by correct amount."
  (interactive)
  (newline-and-indent)
  (newline-and-indent)
  (forward-line -1)
  (indent-according-to-mode))
(defun av/auto-indent-method-maybe ()
  "Check if point is at a closing brace then auto indent."
  (interactive)
  (let ((char-at-point (following-char)))
    (if (or (char-equal ?} char-at-point) (char-equal ?) char-at-point))
        (av/auto-indent-method)
      (newline-and-indent))))
(global-set-key (kbd "RET") 'av/auto-indent-method-maybe)

;; Utility to fill line with dashes
(defun fill-to-end ()
  "Fill rest of line with dashes up to 80 column width."
  (interactive)
  (save-excursion
    (end-of-line)
    (while (< (current-column) 80)
      (insert-char ?-))))

;; scrolling  ------------------------------------------------------------------

;; modern scrolling using page up
(global-set-key [next]
                (lambda () (interactive)
                  (condition-case nil (scroll-up)
                    (end-of-buffer (goto-char (point-max))))))

;; modern scrolling using page down
(global-set-key [prior]
                (lambda () (interactive)
                  (condition-case nil (scroll-down)
                    (beginning-of-buffer (goto-char (point-min))))))

;; Smooth scrolling
(require 'smooth-scrolling)
(smooth-scrolling-mode 1)

;;; buffers.el ends here
