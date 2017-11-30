;;; package --- my emacs config
;;; Commentary:
;;; Code:

;; Adding MELPA
(require 'package)
(package-initialize)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))

;; installed packages

(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)
(setq use-package-always-ensure t)

;; to install everything: M-x RET package-install-selected-packages
;; Adding custom libraries
(add-to-list 'load-path "~/.emacs.d/config")
(load-library "emacs")
(load-library "buffers")
(load-library "lang")
(load-library "look")
(load-library "others")

(setq custom-file "~/.emacs.d/package-selected-packages.el")
(load custom-file)

;;; init.el ends here
(put 'erase-buffer 'disabled nil)
