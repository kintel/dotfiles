;
; Enable site-lisp in ~/.emacs.d
;
(add-to-list 'load-path "~/.emacs.d/site-lisp")


; MELPA
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

;
; Set Cmd to meta (necessary since Emacs 23)
;
(setq mac-option-key-is-meta nil)
(setq mac-command-key-is-meta t)
(setq mac-command-modifier 'meta)
(setq mac-option-modifier nil)
; Cmd-h = Hide
(global-set-key "\M-h" 'ns-do-hide-emacs)
; Open instead of append dragged files
(define-key global-map [ns-drag-file] 'ns-find-file)
; Never open dragged files in a new frame
(setq ns-pop-up-frames nil)
; Cursor up/down follows newline, not visual line (reverts to Emacs 22 behavior)
(setq line-move-visual nil)

;;
;;
;; Misc. settings
;;
(tool-bar-mode 0)
(blink-cursor-mode -1)
(show-paren-mode 1)
(setq blink-matching-paren t)
(toggle-uniquify-buffer-names)
;; Change selection mode
(delete-selection-mode 1)

;; Arduino is C++
(setq auto-mode-alist
      (append
       '(("\.pde$" . c++-mode)
         ) auto-mode-alist))
;; C headers are C++
(setq auto-mode-alist (cons '("\\.h\\'" . c++-mode) auto-mode-alist))

;; No tabs
(setq-default indent-tabs-mode nil)

;; Key bindings
(global-set-key "\M-j" 'goto-line)
(global-set-key "\M-z" 'undo)
(global-set-key (quote [f12]) 'call-last-kbd-macro)
(global-set-key (quote [f11]) 'overwrite-mode)
(global-set-key [home] 'beginning-of-buffer)
(global-set-key [end] 'end-of-buffer)
(global-set-key "\C-\M-a" 'beginning-of-buffer)
(global-set-key "\C-\M-e" 'end-of-buffer)

(defun my-c-mode-modifications ()
  (interactive)
  (define-key c-mode-base-map "\C-\M-a" 'beginning-of-buffer)
  (define-key c-mode-base-map "\C-\M-e" 'end-of-buffer))
(add-hook 'c-mode-common-hook 'my-c-mode-modifications)


;;; Easy bookmarks
;
(defalias 'bookmarkset1
  (read-kbd-macro "ESC xbookmark-set RET 1 RET"))
(defalias 'bookmarkjump1
  (read-kbd-macro "ESC xbookmark-jump RET 1 RET"))

(global-set-key [\C-f1] 'bookmarkset1)
(global-set-key [\S-f1] 'bookmarkjump1)

(defalias 'bookmarkset2
  (read-kbd-macro "ESC xbookmark-set RET 2 RET"))
(defalias 'bookmarkjump2
  (read-kbd-macro "ESC xbookmark-jump RET 2 RET"))
(global-set-key [\C-f2] 'bookmarkset2)
(global-set-key [\S-f2] 'bookmarkjump2)

(defalias 'bookmarkset3
  (read-kbd-macro "ESC xbookmark-set RET 3 RET"))
(defalias 'bookmarkjump3
  (read-kbd-macro "ESC xbookmark-jump RET 3 RET"))
(global-set-key [\C-f3] 'bookmarkset3)
(global-set-key [\S-f3] 'bookmarkjump3)

(defalias 'bookmarkset4
  (read-kbd-macro "ESC xbookmark-set RET 4 RET"))
(defalias 'bookmarkjump4
  (read-kbd-macro "ESC xbookmark-jump RET 4 RET"))
(global-set-key [\C-f4] 'bookmarkset4)
(global-set-key [\S-f4] 'bookmarkjump4)

(text-mode)

;; Resize window
(defun resize-frame ()
  "Resize current frame to 91 50"
  (interactive)
  (set-frame-size (selected-frame) 91 50))
(resize-frame)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(js-indent-level 2)
 '(js3-highlight-external-variables nil)
 '(js3-mode-show-parse-errors nil)
 '(js3-mode-show-strict-warnings nil))
 ; We use flycheck for this

(put 'upcase-region 'disabled nil)

; Makerbot's coding style
(defun makerbot-c-mode ()
  "C mode with adjusted defaults for use with code from Makerbot."
  (interactive)
;  (make-variable-buffer-local 'tab-width)
;  (make-variable-buffer-local 'c-basic-offset)
  (make-variable-buffer-local 'indent-tabs-mode)
;  (make-variable-buffer-local 'version-control)
  (c++-mode)
  (setq mode-name "C++/MB")
  (c-set-style "K&R") 
  (setq tab-width 2)
  (setq c-basic-offset 2)
  (setq indent-tabs-mode t)
;  (setq version-control 't)
)

(push '(".*/makerbot.*/.*\\.[ch]+\\'" . makerbot-c-mode) auto-mode-alist)

; Clifford's coding style
(defun clifford-c-mode ()
  "C mode with adjusted defaults for use with code from Clifford."
  (interactive)
;  (make-variable-buffer-local 'tab-width)
;  (make-variable-buffer-local 'c-basic-offset)
  (make-variable-buffer-local 'indent-tabs-mode)
;  (make-variable-buffer-local 'version-control)
  (c++-mode)
  (setq mode-name "C++/C")
  (c-set-style "K&R") 
  (setq tab-width 2)
  (setq c-basic-offset 2)
  (setq indent-tabs-mode t)
;  (setq version-control 't)
)

(push '(".*/openscad.*/.*\\.[ch]+\\'" . clifford-c-mode) auto-mode-alist)
(push '(".*/openscad.*/.*\\.[ch]pp\\'" . clifford-c-mode) auto-mode-alist)

; Mrdoob's coding style
(autoload 'js3-mode "js3-mode" nil t)
(defun mrdoob-js-mode ()
  "js3-mode with adjusted defaults for use with code from Mr.doob."
  (interactive)
  (js3-mode)
  (setq mode-name "js/Mr.doob")
  (setq tab-width 2)
  (setq js3-basic-offset 2)
  (setq indent-tabs-mode t)
)
(push '("three.js.*\\.js\\'" . mrdoob-js-mode) auto-mode-alist)

;;; Stefan Monnier <foo at acm.org>. It is the opposite of 
;;; fill-paragraph. Takes a multi-line paragraph and makes 
;;; it into a single line of text.
(defun unfill-paragraph ()
  (interactive)
  (let ((fill-column (point-max)))
    (fill-paragraph nil)))

(global-set-key "\C-\M-q" 'unfill-paragraph)

;
; CMake mode
;

; Add cmake listfile names to the mode list.
(add-to-list 'auto-mode-alist '("CMakeLists\\.txt$" . cmake-mode))
(add-to-list 'auto-mode-alist '("\\.cmake$" . cmake-mode))
(autoload 'cmake-mode "~/.cmake/cmake-mode.el" t)

; OpenSCAD mode
(add-to-list 'auto-mode-alist '("\\.scad$" . scad-mode))
(autoload 'scad-mode "~/.emacs.d/site-lisp/scad-mode.el" t)

; js3-mode
(autoload 'js3-mode "js3-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.jsx\\'" . js3-mode))
;(setq js3-basic-offset 4)
(add-hook 'js3-mode-hook 'my-js3-mode-hook)
(defun my-js3-mode-hook ()
(define-key js3-mode-map "\M-j" nil))

; Markdown mode
(add-to-list 'load-path "~/.emacs.d/markdown-mode")
(autoload 'markdown-mode "markdown-mode"
   "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text$" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown$" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md$" . markdown-mode))

; auto-complete mode
(add-to-list 'load-path "~/.emacs.d/auto-complete")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/auto-complete/ac-dict")
(ac-config-default)

; recentf-mode

(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

; nvm

(require 'nvm)
(copy-file "~/.nvm/alias/default" "~/.nvmrc" t)
(nvm-use-for)
(exec-path-from-shell-initialize)

; flycheck

(require 'flycheck)
(add-hook 'after-init-hook #'global-flycheck-mode)

;; Let flycheck use a locally instaleld eslint
(defun my/use-eslint-from-node-modules ()
  (let* ((root (locate-dominating-file
                (or (buffer-file-name) default-directory)
                "node_modules"))
         (eslint (and root
                      (expand-file-name "node_modules/.bin/eslint"
                                        root))))
    (when (and eslint (file-executable-p eslint))
      (setq-local flycheck-javascript-eslint-executable eslint))))

(add-hook 'flycheck-mode-hook #'my/use-eslint-from-node-modules)

;; disable jshint since we prefer eslint checking
(setq-default flycheck-disabled-checkers
              (append flycheck-disabled-checkers
                      '(javascript-jshint)))

(put 'flycheck-clang-args 'safe-local-variable (lambda (xx) t))
(add-hook 'c++-mode-hook (lambda () (setq flycheck-gcc-language-standard "c++11")))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'downcase-region 'disabled nil)
