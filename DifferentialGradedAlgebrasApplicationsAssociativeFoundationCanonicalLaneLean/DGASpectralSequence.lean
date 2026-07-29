import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DifferentialGradedAlgebrasApplicationsAssociativeFoundationCanonicalLaneLean

structure DGASpectralSequence (A : DGAlgebraPackage) where
  pages : ℕ → Type u
  differentials : ℕ → (pages 0 → pages 0)
  convergence : pages 0 → A.algebra.carrier
  pageZeroFromAlgebra : pages 0 = A.algebra.carrier
  closedProperty : Prop

structure DGASpectralSequencePackage (A : DGAlgebraPackage) where
  spectralSequence : DGASpectralSequence A
  closed : spectralSequence.closedProperty

structure DGASpectralSequenceEvidence (A : DGAlgebraPackage) (P : DGASpectralSequencePackage A) where
  closedClosed : P.closed

def DGASpectralSequenceClosed (A : DGAlgebraPackage) (P : DGASpectralSequencePackage A) : Prop :=
  P.closed

theorem dga_spectral_sequence_closed_from_evidence (A : DGAlgebraPackage) (P : DGASpectralSequencePackage A) (E : DGASpectralSequenceEvidence A P) :
    DGASpectralSequenceClosed A P := by
  exact E.closedClosed

end DifferentialGradedAlgebrasApplicationsAssociativeFoundationCanonicalLaneLean
end HautevilleHouse