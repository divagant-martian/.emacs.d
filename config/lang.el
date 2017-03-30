;;; package --- language specific settings
;;; Commentary:
;;; Code:


;; All langs configurations ----------------------------------------------------

;; autocompletion
(add-hook 'after-init-hook 'global-company-mode)
(setq-default company-idle-delay 0)
(setq-default company-dabbrev-downcase nil)

;; documentation
(company-quickhelp-mode 1)
(setq-default company-quickhelp-delay nil)
(eval-after-load 'company
  '(define-key company-active-map
     (kbd "<f3>") #'company-quickhelp-manual-begin))

;; on the fly syntax checking
(add-hook 'after-init-hook #'global-flycheck-mode)


;; Rust ------------------------------------------------------------------------

(add-hook 'rust-mode-hook #'racer-mode)
(add-hook 'racer-mode-hook #'eldoc-mode)
(add-hook 'racer-mode-hook #'company-mode)
(global-set-key (kbd "TAB") #'company-indent-or-complete-common)
(setq-default company-tooltip-align-annotations t)


;; HTML, Js, Jsx, Css ----------------------------------------------------------

(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.html$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsx\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.js\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.css?\\'" . web-mode))
(setq-default web-mode-content-types-alist
      '(("jsx" . "\\.js[x]?\\'")))

(setq web-mode-enable-auto-quoting nil)
(setq web-mode-markup-indent-offset 2
      web-mode-css-indent-offset 2
      web-mode-code-indent-offset 2)
(setq-default js-indent-level 2)

;;; lang.el ends here
