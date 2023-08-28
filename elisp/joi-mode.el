;;; joi-mode.el --- Major mode for Joi -*- lexical-binding: t; -*-

(require 'rx)
(require 'js)

(defconst joi-mode-syntax-table
  (let ((table (make-syntax-table)))
	(modify-syntax-entry ?\" "\"" table) ;; string literals "
	(modify-syntax-entry ?\\ "\\" table) ;; escape character \

	;; Additional symbols
	(modify-syntax-entry ?_ "w" table) ;; underscores in names

	(modify-syntax-entry ?+ "." table)
	(modify-syntax-entry ?- "." table)
	(modify-syntax-entry ?: "." table)
	(modify-syntax-entry ?> "." table)
	(modify-syntax-entry ?< "." table)
	(modify-syntax-entry ?= "." table)

	(modify-syntax-entry ?! "." table)
	(modify-syntax-entry ?$ "." table)
	(modify-syntax-entry ?^ "." table)
	(modify-syntax-entry ?% "." table)
	(modify-syntax-entry ?& "." table)
	(modify-syntax-entry ?| "." table)
	(modify-syntax-entry ?~ "." table)
	(modify-syntax-entry ?. "." table)
	(modify-syntax-entry ?, "." table)

	;; Modify some syntax entries to allow nested block comments
	(modify-syntax-entry ?/ ". 124b" table)
	(modify-syntax-entry ?* ". 23n" table)
	(modify-syntax-entry ?\n "> b" table)
	(modify-syntax-entry ?\^m "> b" table)
	
	table))

(defconst joi-keywords
  '("if" "else" "case"
	"for" "break" "continue"
	"defer" "return"
	"struct" "union" "enum"))

(defconst joi-builtins
  '("cast"))

(defconst joi-constants
  '("true" "false"))

(defconst joi-typenames
  '("int"  "s8" "s16" "s32" "s64"
	"uint" "u8" "u16" "u32" "u64"
	"f32" "f64" "b32" "string"))

(defun joi-wrap-word-rx (s)
  (concat "\\<" s "\\>"))

(defun joi-keywords-rx (keywords)
  "build keyword regexp"
  (joi-wrap-word-rx (regexp-opt keywords t)))

(defconst joi-number-rx
  (rx (and
	   symbol-start
	   (or (and (+ digit) (opt (and (any "eE") (opt (any "-+")) (+ digit))))
		   (and "0" (any "xX") (+ hex-digit)))
	   (opt (and (any "_" "A-Z" "a-z") (* (any "_" "A-Z" "a-z" "0-9"))))
	   symbol-end)))

(defconst joi-font-lock-defaults
  `(
	;; Keywords
	(,(joi-keywords-rx joi-keywords) 1 font-lock-keyword-face)

	;; Built-ins
	(,(joi-keywords-rx joi-builtins) 1 font-lock-variable-name-face)
	
	;; Constants
	(,(joi-keywords-rx joi-constants) 1 font-lock-constant-face)

	("#\\w+" . font-lock-preprocessor-face)

	;; Strings
	("\\\".*\\\"" . font-lock-string-face)

	;; Numbers
	(,(joi-wrap-word-rx joi-number-rx) . font-lock-constant-face)

	;; Types
	(,(joi-keywords-rx joi-typenames) 1 font-lock-type-face)))

(defalias 'joi-parent-mode
  (if (fboundp 'prog-mode) 'prog-mode 'fundamental-mode))

;; imenu hookup
(add-hook 'joi-mode-hook
		  (lambda ()
			(setq imenu-generic-expression
				  '(("type" "^\\(.*:*.*\\) : " 1)
					("function" "^\\(.*\\) :: " 1)
					("struct" "^\\(.*\\) *:: *\\(struct\\)\\(.*\\){" 1)))))

(defun joi--indent-on-parenthesis ()
  (when (and (= (char-syntax (char-before)) ?\))
			 (= (save-excursion (back-to-indentation) (point)) (1- (point))))
   (js-indent-line)))

(defun joi--add-self-insert-hooks ()
  (add-hook 'post-self-insert-hook
			'joi--indent-on-parenthesis))

;;;###autoload
(define-derived-mode joi-mode joi-parent-mode "Joi"
  :syntax-table joi-mode-syntax-table
  :group 'joi
  (setq bidi-paragraph-direction 'left-to-right)
  (setq-local require-final-newline mode-require-final-newline)
  (setq-local parse-sexp-ignore-comments t)
  (setq-local comment-start-skip "\\(//+\\|/\\*+\\)\\s *")
  (setq-local comment-start "//")
  (setq-local block-comment-start "/*")
  (setq-local block-comment-end "*/")
  (setq-local indent-line-function 'js-indent-line)
  (setq-local font-lock-defaults '(joi-font-lock-defaults))

  ;; Add indent functionality on parenthesis.
  (joi--add-self-insert-hooks)

  (font-lock-ensure))

;;;###autoload
(add-to-list 'auto-mode-alist '("\\.joi\\'" . joi-mode))
(provide 'joi-mode)
