;;; Code:

(require 'emaze)
(require 'ert)

(ert-deftest emaze-test-compute-cell-number ()
  "Compute the number of grid cells."
  (should (equal (emaze-ncell (emaze-make-grid 5 5)) 25))
  (should (equal (emaze-ncell (emaze-make-grid 7 3)) 21))
  (should (equal (emaze-ncell (emaze-make-grid 1 1))  1))
  (should (equal (emaze-ncell (emaze-make-grid 0 0))  0))
  (should (equal (emaze-ncell (emaze-make-grid 2 2)) 4)))

(ert-deftest emaze-test-compute-height ()
  "Compute the height of a grid."
  (should (equal (emaze-height (emaze-make-grid 5 2)) 5))
  (should (equal (emaze-height (emaze-make-grid 1 10)) 1)))

(ert-deftest emaze-test-compute-width ()
  "Compute the width of a grid."
  (should (equal (emaze-width (emaze-make-grid 5 2)) 2))
  (should (equal (emaze-width (emaze-make-grid 1 1)) 1))
  (should (equal (emaze-width (emaze-make-grid 1 10)) 10)))

(ert-deftest emaze-test-get-cell ()
  "Get the cell for a specific coordinate."
  (let ((grid (emaze-make-grid 4 4)))
    (should (not (ht-empty? (emaze-get-cell 2 2 grid))))
    (should (equal (emaze-get-cell 4 1 grid) nil))
    (should (equal (emaze-get-cell -1 1 grid) nil))))

(ert-deftest emaze-test-cell-neighbors ()
  "Get the size of the neighbors list of a cell."
  (let ((grid (emaze-make-grid 4 4))
        (cell_a (emaze-make-cell 0 0))
        (cell_b (emaze-make-cell 2 2)))
    (should (equal (length (emaze-cell-neighbors cell_a grid)) 2))
    (should (equal (length (emaze-cell-neighbors cell_b grid)) 4))))

;; Local Variables:
;; indent-tabs-mode: nil
;; End:

;;; grid-test.el ends here
