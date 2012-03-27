;;; ruby-tools.el --- Collection of handy functions for ruby-mode

;; Copyright (C) 2012 Johan Andersson

;; Author: Johan Andersson <johan.rejeep@gmail.com>
;; Maintainer: Johan Andersson <johan.rejeep@gmail.com>
;; Version: 0.0.1
;; Keywords: speed, convenience, ruby
;; URL: http://github.com/rejeep/ruby-tools

;; This file is NOT part of GNU Emacs.


;;; License:

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 3, or (at your option)
;; any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to the
;; Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
;; Boston, MA 02110-1301, USA.


;;; Commentary:

;; ruby-tools is a minor mode for Emacs that can be used with
;; ruby-mode. It includes various handy functions that will improve
;; your productivity.
;;
;; To use ruby-tools-mode, make sure that this file is in Emacs load-path:
;;   (add-to-list 'load-path "/path/to/directory/or/file")
;;
;; Then require ruby-tools:
;;   (require 'ruby-tools)
;;
;; ruby-tools-mode is automatically started in ruby-mode.


;;; Code:

(require 'ruby-mode)

(defvar ruby-tools-mode-map
  (let ((map (make-sparse-keymap)))
    (define-key map (kbd "C-'") 'ruby-tools-symbol-to-single-quote-string)
    (define-key map (kbd "C-\"") 'ruby-tools-symbol-to-double-quote-string)
    map)
  "Keymap for `ruby-tools-mode'.")

(defun ruby-tools-symbol-to-single-quote-string ()
  "Turn symbol at point to a single quote string."
  (interactive)
  (ruby-tools-symbol-to-string "'"))

(defun ruby-tools-symbol-to-double-quote-string ()
  "Turn symbol at point to a double quote string."
  (interactive)
  (ruby-tools-symbol-to-string "\""))

(defun ruby-tools-symbol-at-point-p ()
  "Checks if cursor is at a symbol or not."
  (memq 'font-lock-constant-face (text-properties-at (point))))

(defun ruby-tools-keyword-region ()
  "Returns min and max points (as a list) for the keyword at point."
  (list
   (or
    (previous-single-property-change (point) 'face)
    (point-min))
   (or
    (next-single-property-change (point) 'face)
    (point-max))))

(defun ruby-tools-symbol-to-string (string-quote)
  "Turn symbol at point to a STRING-QUOTE string."
  (if (ruby-tools-symbol-at-point-p)
      (let* ((region (ruby-tools-keyword-region))
             (min (nth 0 region))
             (max (nth 1 region)))
        (save-excursion
          (delete-region min (1+ min))
          (goto-char min)
          (insert string-quote)
          (goto-char max)
          (insert string-quote)))))

;;;###autoload
(define-minor-mode ruby-tools-mode
  "Collection of handy functions for ruby-mode."
  :init-value nil
  :lighter " rt"
  :keymap ruby-tools-mode-map)

(add-hook 'ruby-mode-hook 'ruby-tools-mode)

(provide 'ruby-tools)

;;; ruby-tools.el ends here
