(setq make-backup-files nil)
(setq auto-save-default nil)

(menu-bar-mode 0)
(tool-bar-mode 0)
;; (scroll-bar-mode 0)
(set-fringe-mode 0)

(setq inhibit-startup-screen t)
(setq visible-bell 1)
(setq ring-bell-function 'ignore) 

(setq-default tab-width 4)
(setq-default c-basic-offset 4)

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(load-theme 'handmade t)

(split-window-horizontally)
(setq default-directory "~/")

(add-to-list 'initial-frame-alist '(fullscreen . maximized))

(add-to-list 'load-path "~/.emacs.d/elisp")
(require 'joi-mode)

;; C / C++ Automatic Header
(defun clueless-c-hook ()
  (defun clueless-source-format ()
	"Format the given file as a source file"
	(interactive)
	(setq BaseFileName (file-name-sans-extension (file-name-nondirectory buffer-file-name)))
	(insert "/* ========================================================================\n")
	(insert "   $File: $\n")
	(insert "   $Date: $\n")
	(insert "   $Revision: $\n")
	(insert "   $Creator: Riccardo Berbeglia $\n")
	(insert "   $Notice: (C) Copyright 2023 by Riccardo Berbeglia. All Rights Reserved. $\n")
	(insert "   ======================================================================== */\n")
	)

  (defun clueless-header-format ()
	(interactive)
	(setq BaseFileName (file-name-sans-extension (file-name-nondirectory buffer-file-name)))
	(insert "#if !defined(")
	(push-mark)
	(insert BaseFileName)
	(upcase-region (mark) (point))
	(pop-mark)
	(insert "_H)\n")
	(insert "/* ========================================================================\n")
	(insert "   $File: $\n")
	(insert "   $Date: $\n")
	(insert "   $Revision: $\n")
	(insert "   $Creator: Riccardo Berbeglia $\n")
	(insert "   $Notice: (C) Copyright 2023 by Riccardo Berbeglia. All Rights Reserved. $\n")
	(insert "   ======================================================================== */\n")
	(insert "\n")
	(insert "#define ")
	(push-mark)
	(insert BaseFileName)
	(upcase-region (mark) (point))
	(pop-mark)
	(insert "_H\n")
	(insert "#endif")
	)

  (cond ((file-exists-p buffer-file-name) t)
		((string-match "[.]cpp" buffer-file-name) (clueless-source-format))
		((string-match "[.]h"   buffer-file-name) (clueless-header-format)))
)

(add-hook 'c-mode-common-hook 'clueless-c-hook)


;; Ido Mode (Minibuffer Completions)
(require 'ido)
(ido-mode t)
