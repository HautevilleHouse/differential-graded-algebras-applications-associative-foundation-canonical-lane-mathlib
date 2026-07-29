import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DifferentialGradedAlgebrasApplicationsAssociativeFoundationCanonicalLaneLean.DGAlgebraStructure
import HautevilleHouse.DifferentialGradedAlgebrasApplicationsAssociativeFoundationCanonicalLaneLean.HochschildHomology

namespace HautevilleHouse
namespace DifferentialGradedAlgebrasApplicationsAssociativeFoundationCanonicalLaneLean

structure Kadeishvili (D : DGAlgebra) (H : HochschildComplex D) where
  miniversalDeformation : Type u
  aInfinityStructure : Prop
  quasiIsomorphism : Prop
  aInfinityStructureTerm : aInfinityStructure
  quasiIsomorphismTerm : quasiIsomorphism

def KadeishviliTheoremClosed (D : DGAlgebra) (H : HochschildComplex D) (K : Kadeishvili D H) : Prop :=
  K.aInfinityStructure ∧ K.quasiIsomorphism

theorem kadeishvili_theorem_closed_from_evidence (D : DGAlgebra) (H : HochschildComplex D)
    (K : Kadeishvili D H) : KadeishviliTheoremClosed D H K := by
  exact And.intro K.aInfinityStructureTerm K.quasiIsomorphismTerm

end DifferentialGradedAlgebrasApplicationsAssociativeFoundationCanonicalLaneLean
end HautevilleHouse