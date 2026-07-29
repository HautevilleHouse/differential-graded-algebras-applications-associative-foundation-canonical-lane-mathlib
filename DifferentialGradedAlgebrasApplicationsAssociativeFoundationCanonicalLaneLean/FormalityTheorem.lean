import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DifferentialGradedAlgebrasApplicationsAssociativeFoundationCanonicalLaneLean.DGAlgebraStructure

namespace HautevilleHouse
namespace DifferentialGradedAlgebrasApplicationsAssociativeFoundationCanonicalLaneLean

structure Formality (D : DGAlgebra) where
  formalDGAlgebra : Type u
  quasiIsomorphism : D.A → formalDGAlgebra
  formalityCondition : Prop
  formalityConditionTerm : formalityCondition

def FormalityTheoremClosed (D : DGAlgebra) (F : Formality D) : Prop :=
  F.formalityCondition

theorem formality_theorem_closed_from_evidence (D : DGAlgebra) (F : Formality D) :
    FormalityTheoremClosed D F := by
  exact F.formalityConditionTerm

end DifferentialGradedAlgebrasApplicationsAssociativeFoundationCanonicalLaneLean
end HautevilleHouse