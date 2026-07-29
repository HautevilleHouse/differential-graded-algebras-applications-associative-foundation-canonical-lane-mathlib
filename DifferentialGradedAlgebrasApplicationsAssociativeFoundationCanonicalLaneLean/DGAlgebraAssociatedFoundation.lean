import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DifferentialGradedAlgebrasApplicationsAssociativeFoundationCanonicalLaneLean

structure DGAlgebraPackage where
  underlyingAlgebra : Type u
  differential : Type v
  product : Type w
  algebraAssociative : Prop
  differentialSquareZero : Prop
  leibnizRule : Prop
  augmented : Prop

structure DGAlgebraEvidence (D : DGAlgebraPackage) where
  algebraAssociativeClosed : D.algebraAssociative
  differentialSquareZeroClosed : D.differentialSquareZero
  leibnizRuleClosed : D.leibnizRule
  augmentedClosed : D.augmented

def DGAlgebraClosed (D : DGAlgebraPackage) : Prop :=
  D.algebraAssociative ∧ D.differentialSquareZero ∧ D.leibnizRule ∧ D.augmented

theorem dg_algebra_closed_from_evidence (D : DGAlgebraPackage) (E : DGAlgebraEvidence D) :
    DGAlgebraClosed D := by
  exact And.intro E.algebraAssociativeClosed
    (And.intro E.differentialSquareZeroClosed
      (And.intro E.leibnizRuleClosed E.augmentedClosed))

end DifferentialGradedAlgebrasApplicationsAssociativeFoundationCanonicalLaneLean
end HautevilleHouse