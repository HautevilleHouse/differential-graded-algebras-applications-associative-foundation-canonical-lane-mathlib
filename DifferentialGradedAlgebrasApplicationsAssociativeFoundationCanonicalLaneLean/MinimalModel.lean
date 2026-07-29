import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DifferentialGradedAlgebrasApplicationsAssociativeFoundationCanonicalLaneLean.DGAAlgebraStructure

namespace HautevilleHouse
namespace DifferentialGradedAlgebrasApplicationsAssociativeFoundationCanonicalLaneLean

structure MinimalModel (A : DGAlgebra ℤ) where
  minimalDGA : DGAlgebra ℤ
  quasiIsomorphism : minimalDGA → A
  freeness : Prop
  decomposability : Prop
  uniqueness : Prop

structure MinimalModelEvidence {A : DGAlgebra ℤ} (M : MinimalModel A) where
  freenessClosed : M.freeness
  decomposabilityClosed : M.decomposability
  uniquenessClosed : M.uniqueness
  minimalModelClosed : freenessClosed ∧ decomposabilityClosed ∧ uniquenessClosed

def MinimalModelClosed {A : DGAlgebra ℤ} (M : MinimalModel A) : Prop :=
  M.freeness ∧ M.decomposability ∧ M.uniqueness

theorem minimal_model_closed_from_evidence {A : DGAlgebra ℤ} (M : MinimalModel A) (E : MinimalModelEvidence M) : MinimalModelClosed M :=
  And.intro E.freenessClosed (And.intro E.decomposabilityClosed E.uniquenessClosed)

end DifferentialGradedAlgebrasApplicationsAssociativeFoundationCanonicalLaneLean
end HautevilleHouse
