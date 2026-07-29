import DifferentialGradedAlgebrasApplicationsAssociativeFoundationCanonicalLaneLean.AdmissibleClass

/-!
# DG Algebra Type Package
-/

namespace HautevilleHouse
namespace DifferentialGradedAlgebrasApplicationsAssociativeFoundationCanonicalLaneLean

structure DGAlgebraType where
  underlyingAlgebra : Type u
  grading : ℕ → Type v
  product : ∀ n m, grading n → grading m → grading (n + m)
  differential : ∀ n, grading n → grading (n + 1)
  associativity : Prop
  gradedLeibniz : Prop
  differentialSquaresZero : Prop

structure DGAlgebraTypeEvidence (A : DGAlgebraType) where
  associativityClosed : A.associativity
  gradedLeibnizClosed : A.gradedLeibniz
  differentialSquaresZeroClosed : A.differentialSquaresZero

def DGAlgebraTypeClosed (A : DGAlgebraType) : Prop :=
  A.associativity ∧ A.gradedLeibniz ∧ A.differentialSquaresZero

theorem dg_algebra_type_closed_from_evidence (A : DGAlgebraType)
    (E : DGAlgebraTypeEvidence A) : DGAlgebraTypeClosed A := by
  exact And.intro E.associativityClosed (And.intro E.gradedLeibnizClosed E.differentialSquaresZeroClosed)

end DifferentialGradedAlgebrasApplicationsAssociativeFoundationCanonicalLaneLean
end HautevilleHouse
