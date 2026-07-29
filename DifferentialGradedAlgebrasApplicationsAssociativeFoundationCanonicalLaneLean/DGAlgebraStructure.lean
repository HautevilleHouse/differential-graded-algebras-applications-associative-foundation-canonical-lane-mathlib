import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DifferentialGradedAlgebrasApplicationsAssociativeFoundationCanonicalLaneLean

structure DGAlgebra where
  A : Type u
  Add : AddCommGroup A
  Mul : Ring A
  deg : A → ℤ
  d : A → A
  d_sq_zero : ∀ a : A, d (d a) = 0
  deg_add : ∀ a b : A, deg (a * b) = deg a + deg b
  deg_d : ∀ a : A, deg (d a) = deg a + 1

def DGAlgebraClosed (D : DGAlgebra) : Prop := ∀ a : A, D.d (D.d a) = 0

theorem dg_algebra_closed_from_evidence (D : DGAlgebra) : DGAlgebraClosed D := by
  intro a
  exact D.d_sq_zero a

end DifferentialGradedAlgebrasApplicationsAssociativeFoundationCanonicalLaneLean
end HautevilleHouse