import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DifferentialGradedAlgebrasApplicationsAssociativeFoundationCanonicalLaneLean.DGAAlgebraStructure

namespace HautevilleHouse
namespace DifferentialGradedAlgebrasApplicationsAssociativeFoundationCanonicalLaneLean

structure HochschildComplex (A : DGAlgebra ℤ) where
  chainGroups : ℕ → Type u
  boundary : ∀ n, chainGroups n → chainGroups (n-1)
  boundarySqZero : ∀ n, ∀ x, boundary (n+1) (boundary n x) = 0
  homotopyInvariance : Prop

structure HochschildHomology (A : DGAlgebra ℤ) where
  homologyGroups : ℕ → Type u
  mapsFromComplex : ∀ n, A.carrier → homologyGroups n
  mapsAreNatural : Prop
  invarianceUnderDerivedEquivalence : Prop

structure HochschildHomologyEvidence {A : DGAlgebra ℤ} (H : HochschildHomology A) where
  mapsFromComplexClosed : ∀ n x, H.mapsFromComplex n x = H.mapsFromComplex n (A.differential x)
  invarianceUnderDerivedEquivalenceClosed : H.invarianceUnderDerivedEquivalence
  hochschildHomologyClosed : mapsFromComplexClosed ∧ invarianceUnderDerivedEquivalenceClosed

def HochschildHomologyClosed {A : DGAlgebra ℤ} (H : HochschildHomology A) : Prop :=
  (∀ n x, H.mapsFromComplex n x = H.mapsFromComplex n (A.differential x)) ∧
  H.invarianceUnderDerivedEquivalence

theorem hochschild_homology_closed_from_evidence {A : DGAlgebra ℤ} (H : HochschildHomology A) (E : HochschildHomologyEvidence H) : HochschildHomologyClosed H :=
  And.intro E.mapsFromComplexClosed E.invarianceUnderDerivedEquivalenceClosed

end DifferentialGradedAlgebrasApplicationsAssociativeFoundationCanonicalLaneLean
end HautevilleHouse
