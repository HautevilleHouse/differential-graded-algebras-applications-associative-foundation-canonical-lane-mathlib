import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DifferentialGradedAlgebrasApplicationsAssociativeFoundationCanonicalLaneLean

structure AdamsResolution (A : DGAlgebraPackage) where
  chain : ℕ → A.algebra.carrier
  differentials : ℕ → (A.algebra.carrier → A.algebra.carrier)
  augmentation : A.algebra.carrier → A.algebra.carrier
  exactness : ∀ n, A.algebra.differential (chain n) = 0
  resolutionProperty : ∀ (x : A.algebra.carrier) (h : A.algebra.differential x = 0), ∃ (n : ℕ), ∃ (y : A.algebra.carrier), chain n = y ∧ augmentation y = x
  minimal : Prop

structure DGAAdamsResolutionPackage (A : DGAlgebraPackage) where
  resolution : AdamsResolution A
  minimal : resolution.minimal

structure DGAAdamsResolutionEvidence (P : DGAAdamsResolutionPackage A) where
  minimalClosed : P.minimal
  resolutionPropertyClosed : P.resolution.resolutionProperty

def DGAAdamsResolutionClosed (P : DGAAdamsResolutionPackage A) : Prop :=
  P.minimal ∧ P.resolution.resolutionProperty

theorem dga_adams_resolution_closed_from_evidence (A : DGAlgebraPackage) (P : DGAAdamsResolutionPackage A) (E : DGAAdamsResolutionEvidence P) :
    DGAAdamsResolutionClosed P := by
  exact And.intro E.minimalClosed E.resolutionPropertyClosed

end DifferentialGradedAlgebrasApplicationsAssociativeFoundationCanonicalLaneLean
end HautevilleHouse