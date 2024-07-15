(setq make-backup-files nil)
(setq auto-save-default nil)

(menu-bar-mode 0)
(tool-bar-mode 0)
;; (scroll-bar-mode 0)
(set-fringe-mode 0)

;; Use UNIX style line endings.
(setq-default buffer-file-coding-system 'unix)

(setq inhibit-startup-screen t)
(setq visible-bell 1)
(setq ring-bell-function 'ignore) 

(setq initial-major-mode 'text-mode)
(setq initial-scratch-message "")

(setq-default tab-width 4)

(setq-default c-basic-offset 4)
(setq-default c-default-style "bsd")
(c-set-offset 'case-label '+) ;; Indent "case" labels.

(setq-default buffer-file-coding-system 'dos)

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(load-theme 'jblow t)
;; (set-background-color "#092a25")

(set-frame-font "Consolas 12" nil t)

;; (split-window-horizontally)
(setq split-window-preferred-function nil)

(setq default-directory "C:/Users/Riccardo")

(add-to-list 'initial-frame-alist '(fullscreen . maximized))
;; (w32-send-sys-command 61488)

(global-auto-revert-mode t)

(global-set-key [?\C-,] 'beginning-of-buffer)
(global-set-key [?\C-.] 'end-of-buffer)

(global-unset-key [?\C-x ?m])
(global-set-key [?\C-x ?m] 'blink-matching-open)

(global-set-key [C-return] 'save-buffer)

(global-set-key "\M-F" 'find-file-other-window)
(global-set-key "\M-B" 'ido-switch-buffer-other-window)
(global-set-key "\M-W" 'other-window)

(add-to-list 'load-path "~/.emacs.d/elisp")

;; Ido Mode (Minibuffer Completions)
(require 'ido)
(ido-mode t)
