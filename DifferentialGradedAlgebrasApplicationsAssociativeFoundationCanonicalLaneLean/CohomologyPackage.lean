import DifferentialGradedAlgebrasApplicationsAssociativeFoundationCanonicalLaneLean.AdmissibleClass

/-!
# Cohomology Package
-/

namespace HautevilleHouse
namespace DifferentialGradedAlgebrasApplicationsAssociativeFoundationCanonicalLaneLean

structure CohomologyPackage (A : DGAlgebraType) where
  cochains : Type u
  differential : cochains → cochains
  cohomology : Type v
  poincareDuality : Prop
  kunnethFormula : Prop

structure CohomologyEvidence {A : DGAlgebraType} (C : CohomologyPackage A) where
  differentialClosed : ∀ x : C.cochains, C.differential (C.differential x) = 0
  poincareDualityClosed : C.poincareDuality
  kunnethFormulaClosed : C.kunnethFormula

def CohomologyClosed {A : DGAlgebraType} (C : CohomologyPackage A) : Prop :=
  (∀ x : C.cochains, C.differential (C.differential x) = 0) ∧ C.poincareDuality ∧ C.kunnethFormula

theorem cohomology_closed_from_evidence {A : DGAlgebraType} (C : CohomologyPackage A)
    (E : CohomologyEvidence C) : CohomologyClosed C := by
  exact And.intro E.differentialClosed (And.intro E.poincareDualityClosed E.kunnethFormulaClosed)

end DifferentialGradedAlgebrasApplicationsAssociativeFoundationCanonicalLaneLean
end HautevilleHouse
