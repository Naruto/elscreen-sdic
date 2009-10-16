;; -*- Mode: Emacs-Lisp -*-
;; elscreen-sdic.el
(defconst elscreen-sdic-version "0.1")
;; Author: Naruto TAKAHASHI <tnaruto@gmail.com>
;; Create: Octver 27, 2008

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 2, or (at your option)
;; any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program; see the file COPYING.  If not, write to
;; the Free Software Foundation, 675 Mass Ave, Cambridge, MA 02139, USA.

(provide 'elscreen-sdic)
(require 'elscreen)

;; Code
(defadvice sdic-describe-word (around elscreen-sdic-describe-word activate)
  (let ((sdic-screen (elscreen-find-screen-by-buffer sdic-buffer-name)))
    (cond ((numberp sdic-screen)
           (elscreen-goto sdic-screen))
          (t (elscreen-create))))
  (if (null ad-do-it)
      (elscreen-kill)
    (delete-other-windows)))

(defadvice sdic-close-window (around elscreen-sdic-close-window activate)
  (if (null ad-do-it)
      nil
      (elscreen-kill)))
