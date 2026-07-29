import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DifferentialGradedAlgebrasApplicationsAssociativeFoundationCanonicalLaneLean.DGAAlgebraStructure

namespace HautevilleHouse
namespace DifferentialGradedAlgebrasApplicationsAssociativeFoundationCanonicalLaneLean

structure KoszulDualityPair (A : DGAlgebra ℤ) where
  koszulDual : DGAlgebra ℤ
  pairing : ℕ → ℕ → Prop
  koszulResolution : Prop
  barConstruction : Prop
  cobarConstruction : Prop
  quasiIsomorphism : Prop

structure KoszulDualityEvidence {A : DGAlgebra ℤ} (K : KoszulDualityPair A) where
  pairingClosed : ∀ i j, K.pairing i j
  koszulResolutionClosed : K.koszulResolution
  barConstructionClosed : K.barConstruction
  cobarConstructionClosed : K.cobarConstruction
  quasiIsomorphismClosed : K.quasiIsomorphism
  koszulDualityClosed : pairingClosed ∧ koszulResolutionClosed ∧ barConstructionClosed ∧ cobarConstructionClosed ∧ quasiIsomorphismClosed

def KoszulDualityClosed {A : DGAlgebra ℤ} (K : KoszulDualityPair A) : Prop :=
  (∀ i j, K.pairing i j) ∧ K.koszulResolution ∧ K.barConstruction ∧ K.cobarConstruction ∧ K.quasiIsomorphism

theorem koszul_duality_closed_from_evidence {A : DGAlgebra ℤ} (K : KoszulDualityPair A) (E : KoszulDualityEvidence K) : KoszulDualityClosed K :=
  And.intro E.pairingClosed
    (And.intro E.koszulResolutionClosed
      (And.intro E.barConstructionClosed
        (And.intro E.cobarConstructionClosed E.quasiIsomorphismClosed)))

end DifferentialGradedAlgebrasApplicationsAssociativeFoundationCanonicalLaneLean
end HautevilleHouse
