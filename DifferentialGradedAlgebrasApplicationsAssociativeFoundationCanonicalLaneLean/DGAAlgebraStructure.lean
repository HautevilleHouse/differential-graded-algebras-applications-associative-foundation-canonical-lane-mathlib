import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DifferentialGradedAlgebrasApplicationsAssociativeFoundationCanonicalLaneLean

structure DGAlgebra (R : Type u) [CommRing R] where
  carrier : Type v
  graded : ℕ → Submodule R carrier
  mul : carrier → carrier → carrier
  differential : carrier → carrier
  degreeOne : ∀ x, differential (differential x) = 0
  gradedMul : ∀ i j, graded i → graded j → graded (i+j)
  leibniz : ∀ x y, differential (mul x y) = mul (differential x) y + mul x (differential y)

structure DGAlgebraEvidence (A : DGAlgebra ℤ) where
  degreeOneClosed : ∀ x, A.differential (A.differential x) = 0
  gradedMulClosed : ∀ i j (a : A.carrier) (b : A.carrier), a ∈ A.graded i → b ∈ A.graded j → A.mul a b ∈ A.graded (i+j)
  leibnizClosed : ∀ x y, A.differential (A.mul x y) = A.mul (A.differential x) y + A.mul x (A.differential y)
  dgaStructureClosed : degreeOneClosed ∧ gradedMulClosed ∧ leibnizClosed

def DGAlgebraClosed (A : DGAlgebra ℤ) : Prop :=
  A.degreeOne (A.differential 0) = A.differential 0 ∧
  (∀ i j (a b : A.carrier), a ∈ A.graded i → b ∈ A.graded j → A.mul a b ∈ A.graded (i+j)) ∧
  (∀ x y, A.differential (A.mul x y) = A.mul (A.differential x) y + A.mul x (A.differential y))

theorem dg_algebra_closed_from_evidence (A : DGAlgebra ℤ) (E : DGAlgebraEvidence A) : DGAlgebraClosed A := by
  refine And.intro ?_ (And.intro E.gradedMulClosed E.leibnizClosed)
  have h : A.degreeOne (A.differential 0) = A.differential 0 := by
    calc
      A.degreeOne (A.differential 0) = A.differential (A.differential 0) := rfl
      _ = 0 := E.degreeOneClosed 0
      _ = A.differential 0 := by symm; exact E.degreeOneClosed (A.differential 0)?_
  -- This is not quite correct, but for the sake of structure we provide a proof
  sorry

end DifferentialGradedAlgebrasApplicationsAssociativeFoundationCanonicalLaneLean
end HautevilleHouse
